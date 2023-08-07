class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.string :dish_type
      t.string :allergens
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
