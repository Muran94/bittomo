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

class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :sender_id, uniqueness: { scope: :receiver_id, message: "既にトークが存在しています。" }

  scope :between, -> (sender_id, receiver_id) {
    where(sender_id: sender_id, receiver_id: receiver_id)
  }
  scope :participating, -> (user_id) {
    where(sender_id: user_id).or(self.where(receiver_id: user_id))
  }

  def partner(current_user)
    sender_id == current_user.id ? receiver : sender
  end

  def has_any_unread_message?(current_user)
    messages.unread(partner(current_user)).present?
  end
end
