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

FactoryBot.define do
  factory :article do
    association :user

    title { "一緒にナインボールを極めませんか！？" }
    body { "平日の夜、もしくは、休日の日中に一緒にビリヤードを練習できる仲間を募集しています！どうぞ、こぞってご応募ください！" }
    prefecture_ids { [[1, 13], [12]].sample }
  end
end
