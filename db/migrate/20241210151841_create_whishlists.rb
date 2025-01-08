class CreateWhishlists < ActiveRecord::Migration[7.1]
  def change
    create_table :whishlists do |t|
      t.integer :total
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
