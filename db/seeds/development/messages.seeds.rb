after 'development:conversations' do
  Conversation.all.each do |conversation|
    (1..100).to_a.sample.times do
      conversation.messages.create(
        body: Faker::Lorem.paragraph_by_chars([10, 30, 50, 100, 250, 1000].sample),
        read: false,
        user_id: [conversation.sender_id, conversation.receiver_id].sample
      )
    end
  end
end
