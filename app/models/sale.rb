class Sale < ApplicationRecord
  belongs_to :company_sale

  validates :purchaser_name, presence: true
  validates :item_description, presence: true
  validates :item_price, presence: true, numericality: true
  validates :purchase_count, presence: true, numericality: true
end
