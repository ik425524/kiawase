class AddIndexToCategory2 < ActiveRecord::Migration[5.2]
  def change
    add_index :topps, :category, length: 30
  end
end
