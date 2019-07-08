class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :prefecture_ids, array: true, default: []

      t.timestamps
    end
  end
end
