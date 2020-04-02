class Amount < ApplicationRecord
  belongs_to :currency
  belongs_to :property

  validates :price, presence: true
end
