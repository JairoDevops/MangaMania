# == Schema Information
#
# Table name: whishlists
#
#  id         :bigint           not null, primary key
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_whishlists_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require "test_helper"

class WhishlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
