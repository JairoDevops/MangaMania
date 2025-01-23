class RemoveProductFromCarshopping < ActiveRecord::Migration[7.1]
  def change
    remove_column :carshoppings, :product_id
  end
end
