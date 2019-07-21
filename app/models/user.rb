# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  activity_prefecture_ids :string           default([]), is an Array
#  avatar                  :string
#  birthday                :date
#  gender                  :integer
#  name                    :string
#  introduction            :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :messages, dependent: :destroy

  enum gender: { male: 0, female: 1 }

  def activity_prefecture_names_ja
    activity_prefecture_ids.map { |p_id| JpPrefecture::Prefecture.find(code: p_id).name }.join("、")
  end

  def age
    Happybirthday.born_on(birthday).age.years_old
  end

  def owner?(current_user)
    return false if current_user.nil?
    id == current_user.id
  end
end
