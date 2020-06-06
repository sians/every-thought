class AddListToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_reference :thoughts, :list, foreign_key: true
  end
end
