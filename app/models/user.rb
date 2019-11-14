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

  # has_one関連付けに伴って自動的に用意されるメソッドを呼び出し、PrivacySettingとNotificationSettingを作成
  after_create_commit :create_privacy_setting
  after_create_commit :create_notification_setting
  after_create_commit :create_article_notification_condition

  has_one :privacy_setting, dependent: :destroy
  has_one :notification_setting, dependent: :destroy
  has_one :article_notification_condition, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :conversations, -> (user) { unscope(where: :user_id).where("sender_id = ? OR receiver_id = ?", user.id, user.id) }, dependent: :destroy

  enum gender: { male: 0, female: 1 }

  MAXIMUM_NAME_LENGTH = 30
  validates :name, presence: true, length: { maximum: MAXIMUM_NAME_LENGTH }
  MAXIMUM_INTRODUCTION_LENGTH = 1_000
  validates :introduction, length: { maximum: MAXIMUM_INTRODUCTION_LENGTH }
  validates :birthday, presence: true
  validates :gender, presence: true, inclusion: { in: genders.keys }
  validates :activity_prefecture_ids, presence: true, prefecture_ids: true

  def activity_prefecture_names_ja
    activity_prefecture_ids.map { |p_id| JpPrefecture::Prefecture.find(code: p_id).name }.join("、")
  end

  def age
    return "年齢不明" if birthday.nil?
    Happybirthday.born_on(birthday).age.years_old
  end

  def owner?(current_user)
    return false if current_user.nil?
    id == current_user.id
  end
end
