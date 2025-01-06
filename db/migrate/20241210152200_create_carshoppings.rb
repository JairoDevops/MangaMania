class CreateCarshoppings < ActiveRecord::Migration[7.1]
  def change
    create_table :carshoppings do |t|
      t.integer :total
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
