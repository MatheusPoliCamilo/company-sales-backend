class CompanySale < ApplicationRecord
  has_many :sales, inverse_of: :company_sale, dependent: :destroy
end
