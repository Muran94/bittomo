class CreateArticleNotificationConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :article_notification_conditions do |t|
      t.references :user, foreign_key: true
      t.integer :gender
      t.integer :age_min
      t.integer :age_max
      t.integer :prefecture_ids, array: true, default: []

      t.timestamps
    end
  end
end
