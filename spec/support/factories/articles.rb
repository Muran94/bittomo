FactoryBot.define do
  factory :article do
    user { nil }
    title { "MyString" }
    body { "MyText" }
    prefecture_ids { "MyString" }
  end
end
