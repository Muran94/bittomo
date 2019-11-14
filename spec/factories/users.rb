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

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    activity_prefecture_ids { [12, 13] }
    avatar { nil }
    birthday { 20.years.ago }
    gender { [:male, :female].sample }
    name { Faker::Name.name }
    introduction { nil }
  end
end
