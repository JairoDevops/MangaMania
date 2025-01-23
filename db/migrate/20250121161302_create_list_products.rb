class CreateListProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :list_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :carshopping, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
