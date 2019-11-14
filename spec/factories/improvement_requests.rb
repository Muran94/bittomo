# == Schema Information
#
# Table name: improvement_requests
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  request_type :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :improvement_request do
    user { nil }
    type { 1 }
    title { "MyString" }
    body { "MyText" }
  end
end
