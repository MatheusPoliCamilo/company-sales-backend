require 'rails_helper'

RSpec.describe CompanySale, type: :model do
  describe '.sales' do
    it { is_expected.to have_many(:sales).inverse_of(:company_sale).dependent(:destroy) }
  end

  describe '.imported_at' do
    it { is_expected.to validate_presence_of :imported_at }
  end

  describe '.total_gross_income' do
    it 'is updated with the total sales price when saved' do
      sales = [build(:sale, item_price: 10.15), build(:sale, item_price: 10.15)]
      company_sale = build(:company_sale, total_gross_income: 0, sales: sales)

      company_sale.save

      expect(company_sale.total_gross_income).to eq 20.30
    end
  end
end
