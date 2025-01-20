class AddUserIdToCarshoppings < ActiveRecord::Migration[7.1]
  def change
    add_column :carshoppings, :user_id, :integer
    add_foreign_key :carshoppings, :users
  end
end
