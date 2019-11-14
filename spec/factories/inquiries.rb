# == Schema Information
#
# Table name: inquiries
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  reply_email :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :inquiry do
    user { nil }
    reply_email { "MyString" }
    body { "MyText" }
  end
end
