require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe '.company_sale' do
    it { is_expected.to belong_to(:company_sale).required }
  end

  describe '.purchaser_name' do
    it { is_expected.to validate_presence_of :purchaser_name }
  end

  describe '.item_price' do
    it { is_expected.to validate_presence_of :item_price }
    it { is_expected.to validate_numericality_of(:item_price) }
  end

  describe '.purchase_count' do
    it { is_expected.to validate_presence_of :purchase_count }
    it { is_expected.to validate_numericality_of(:item_price) }
  end
end
