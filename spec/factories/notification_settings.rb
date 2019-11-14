# == Schema Information
#
# Table name: notification_settings
#
#  id                                    :bigint           not null, primary key
#  user_id                               :bigint
#  receive_article_arrival_notifications :boolean          default(TRUE)
#  receive_message_notifications         :boolean          default(TRUE)
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#

FactoryBot.define do
  factory :notification_setting do
    user { nil }
    receive_article_arrival_notifications { false }
    receive_message_notifications { false }
  end
end
