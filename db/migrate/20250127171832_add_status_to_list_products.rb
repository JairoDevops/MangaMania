class AddStatusToListProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :list_products, :status, :string
  end
end
