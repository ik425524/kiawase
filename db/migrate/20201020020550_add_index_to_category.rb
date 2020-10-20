class AddIndexToCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :bottoms, :category, length: 30
  end
end
