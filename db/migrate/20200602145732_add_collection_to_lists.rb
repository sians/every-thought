class AddCollectionToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :collection, foreign_key: true
  end
end
