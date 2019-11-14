# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :conversation do
    association :sender, factory: :user
    association :receiver, factory: :user

    after(:build) do |conversation|
      conversation.messages << build(:message, user: conversation.sender, conversation: conversation)
    end
  end
end
