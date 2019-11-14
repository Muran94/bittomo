class CreatePrivacySettings < ActiveRecord::Migration[6.0]
  def change
    create_table :privacy_settings do |t|
      t.references :user, foreign_key: true
      t.boolean :show_activity_prefecture, default: true, comment: "活動都道府県の公開設定"
      t.boolean :show_gender, default: true, comment: "性別の公開設定"
      t.boolean :show_age, default: true, comment: "年齢の公開設定"

      t.timestamps
    end
  end
end
