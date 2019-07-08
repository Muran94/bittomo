# == Schema Information
#
# Table name: improvement_requests
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  request_type :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ImprovementRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
