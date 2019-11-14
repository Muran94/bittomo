# == Schema Information
#
# Table name: article_notification_conditions
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  gender         :integer
#  age_min        :integer
#  age_max        :integer
#  prefecture_ids :string           default([]), is an Array
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe ArticleNotificationCondition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
