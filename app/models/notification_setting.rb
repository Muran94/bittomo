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

class NotificationSetting < ApplicationRecord
  belongs_to :user
end
