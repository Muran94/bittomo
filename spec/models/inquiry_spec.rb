# == Schema Information
#
# Table name: inquiries
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  reply_email :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
