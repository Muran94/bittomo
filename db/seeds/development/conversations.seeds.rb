after 'development:users' do
  sender = User.find_by_email("headiv94@gmail.com")
  receivers = User.where(email: %w[tsuchikata@gmail.com shibata@gmail.com boroboro@gmail.com])
  receivers.each do |receiver|
    Conversation.find_or_create_by(sender_id: sender.id, receiver_id: receiver.id)
  end
end
