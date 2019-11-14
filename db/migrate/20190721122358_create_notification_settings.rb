class CreateNotificationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_settings do |t|
      t.references :user, foreign_key: true
      t.boolean :receive_article_arrival_notifications, default: true
      t.boolean :receive_message_notifications, default: true

      t.timestamps
    end
  end
end
