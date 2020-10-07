class CreateTopps < ActiveRecord::Migration[5.2]
  def change
    create_table :topps do |t|
      t.string :image
      t.integer :size
      t.string :maker
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
