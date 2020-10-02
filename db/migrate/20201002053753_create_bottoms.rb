class CreateBottoms < ActiveRecord::Migration[5.2]
  def change
    create_table :bottoms do |t|
      t.string :image, null: false
      t.integer :size
      t.string :maker
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
