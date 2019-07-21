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

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
  # validates :conversation_id, presence: true
  validates :user_id, presence: true

  scope :unread, -> (partner) { where(user_id: partner.id, read: false) }

  def mine?(current_user)
    user_id == current_user.id
  end
end
