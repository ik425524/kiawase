class CreateBottoms < ActiveRecord::Migration[5.2]
  def change
    create_table :bottoms do |t|
      t.string :image
      t.integer :size
      t.string :maker
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
