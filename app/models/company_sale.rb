class CompanySale < ApplicationRecord
  has_many :sales, inverse_of: :company_sale, dependent: :destroy

  validates :imported_at, presence: true

  before_save :update_total_gross_income

  private

  def update_total_gross_income
    self.total_gross_income = sales.sum(&:item_price)
  end
end
