FactoryBot.define do
  factory :improvement_request do
    user { nil }
    type { 1 }
    title { "MyString" }
    body { "MyText" }
  end
end
