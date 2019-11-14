# == Schema Information
#
# Table name: privacy_settings
#
#  id                       :bigint           not null, primary key
#  user_id                  :bigint
#  show_activity_prefecture :boolean          default(TRUE)
#  show_gender              :boolean          default(TRUE)
#  show_age                 :boolean          default(TRUE)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'rails_helper'

RSpec.describe PrivacySetting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
