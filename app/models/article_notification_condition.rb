# == Schema Information
#
# Table name: article_notification_conditions
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  gender         :integer
#  age_min        :integer
#  age_max        :integer
#  prefecture_ids :string           default([]), is an Array
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ArticleNotificationCondition < ApplicationRecord
  belongs_to :user

  enum gender: { male: 0, female: 1 }
end
