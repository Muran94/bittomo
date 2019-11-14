# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  conversation_id :bigint
#  user_id         :bigint
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :message do
    association :conversation
    association :user

    body { "初めまして！募集記事を拝見しました！是非とも参加させてください！" }
    read { false }
  end
end
