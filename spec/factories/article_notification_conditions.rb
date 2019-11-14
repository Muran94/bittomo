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

FactoryBot.define do
  factory :article_notification_condition do
    user { nil }
    gender { 1 }
    age_min { 1 }
    age_max { 1 }
    prefectures { "" }
  end
end
