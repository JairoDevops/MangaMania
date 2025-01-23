class AddEditorialToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :editorial, null: false, foreign_key: true
  end
end
