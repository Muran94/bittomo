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

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
