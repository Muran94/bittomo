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

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
