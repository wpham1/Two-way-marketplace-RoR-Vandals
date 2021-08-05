class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :size
      t.string :finish
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
