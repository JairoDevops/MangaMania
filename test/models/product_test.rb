# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  description  :text
#  name         :string
#  price        :integer
#  stock        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#  editorial_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id   (category_id)
#  index_products_on_editorial_id  (editorial_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (editorial_id => editorials.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
