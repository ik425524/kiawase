class AddCategoryIdTotops < ActiveRecord::Migration[5.2]
  def change
    add_reference :topps, :category, foreign_key: true
  end
end
