FactoryBot.define do
  factory :inquiry do
    user { nil }
    reply_email { "MyString" }
    body { "MyText" }
  end
end
