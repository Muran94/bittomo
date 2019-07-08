# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  title          :string
#  body           :text
#  prefecture_ids :string           default([]), is an Array
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :user

  def prefecture_names_ja
    prefecture_ids.map { |p_id| JpPrefecture::Prefecture.find(code: p_id).name }.join("、")
  end
end
