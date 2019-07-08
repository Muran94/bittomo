class CreateImprovementRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :improvement_requests do |t|
      t.references :user, foreign_key: true
      t.integer :request_type
      t.text :body

      t.timestamps
    end
  end
end
