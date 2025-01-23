class AddDefaultValueToCarShopping < ActiveRecord::Migration[7.1]
  def change
    change_column_default :carshoppings, :total, 0
  end
end
