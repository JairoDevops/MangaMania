# == Schema Information
#
# Table name: list_products
#
#  id             :bigint           not null, primary key
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  carshopping_id :bigint           not null
#  product_id     :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_list_products_on_carshopping_id  (carshopping_id)
#  index_list_products_on_product_id      (product_id)
#  index_list_products_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (carshopping_id => carshoppings.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class ListProduct < ApplicationRecord
  belongs_to :product
  belongs_to :carshopping
  belongs_to :user
end
