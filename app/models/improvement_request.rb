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

class ImprovementRequest < ApplicationRecord
  belongs_to :user, optional: true

  enum request_type: { improvement: 0, addition: 1, bug_fix: 2 }
end
