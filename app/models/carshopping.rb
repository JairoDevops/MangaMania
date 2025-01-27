# == Schema Information
#
# Table name: carshoppings
#
#  id         :bigint           not null, primary key
#  total      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

=begin


=end
class Carshopping < ApplicationRecord
  belongs_to :user

  has_many :list_products

  #@carshopping.products = [producto1, producto2]
  has_many :products, through: :list_products

  # list_product_id  user_id product_id carshopping_id
  #   1                 1      1(name: batman)           2
  #   1                 1      2           2

  #carshopping.last.user

  #metodo para actualizar el total

  def actualizar_total(precio)
    #total anterior
    #cuanto se va a sumar (product.price)
    nuevo_total = self.total + precio

    puts "-------"
    puts nuevo_total
    puts "-------"
    self.update(total: nuevo_total)
  end
end
