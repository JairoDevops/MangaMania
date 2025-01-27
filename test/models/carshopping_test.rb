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
require "test_helper"

class CarshoppingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
