class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.string :title
      t.boolean :archived
      t.integer :status
      t.string :date_completed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
