# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  title          :string
#  body           :text
#  prefecture_ids :string           default([]), is an Array
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
