require 'rails_helper'

RSpec.describe CompanySale, type: :model do
  describe '.sales' do
    it { is_expected.to have_many(:sales).inverse_of(:company_sale).dependent(:destroy) }
  end

  describe '.imported_at' do
    it { is_expected.to validate_presence_of :imported_at }
  end

  describe '.total_gross_income' do
    it { is_expected.to validate_presence_of :total_gross_income }
  end
end
