class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :img
  belongs_to :editorial

end
