require 'rails_helper'

RSpec.describe SalesAndMerchantsBuilder do
  subject(:sales) { described_class.build(sales_to_build) }

  let(:sales_to_build) do
    [
      {
        'purchaser name': 'João Silva',
        'item description': 'R$10 off R$20 of food',
        'item price': '10.0',
        'purchase count': '2',
        'merchant address': '987 Fake St',
        'merchant name': "Bob's Pizza"
      }.with_indifferent_access,
      {
        'purchaser name': 'Amy Pond',
        'item description': 'R$30 of awesome for R$10',
        'item price': '20.0',
        'purchase count': '5',
        'merchant address': '456 Unreal Rd',
        'merchant name': "Tom's Awesome Shop"
      }.with_indifferent_access
    ]
  end

  describe '#build' do
    it 'retuns a list of instances of Sales' do
      expect(sales.first).to be_an_instance_of Sale
    end

    describe '.purchaser_name' do
      it 'returns the purchaser name' do
        expect(sales.first.purchaser_name).to eql 'João Silva'
        expect(sales.second.purchaser_name).to eql 'Amy Pond'
      end
    end

    describe '.item_description' do
      it 'returns the item description' do
        expect(sales.first.item_description).to eql 'R$10 off R$20 of food'
        expect(sales.second.item_description).to eql 'R$30 of awesome for R$10'
      end
    end

    describe '.item_price' do
      it 'returns the item price' do
        expect(sales.first.item_price).to be 10.0
        expect(sales.second.item_price).to be 20.0
      end
    end

    describe '.purchase_count' do
      it 'returns the purchase count' do
        expect(sales.first.purchase_count).to be 2
        expect(sales.second.purchase_count).to be 5
      end
    end

    describe '.merchant' do
      it 'returns the merchant with the given name if it already exists' do
        merchant = create(:merchant, name: "Bob's Pizza", address: 'Address of an already created merchant')

        sales_to_build = [
          {
            'purchaser name': 'João Silva',
            'item description': 'R$10 off R$20 of food',
            'item price': '10.0',
            'purchase count': '2',
            'merchant address': '987 Fake St',
            'merchant name': "Bob's Pizza"
          }.with_indifferent_access
        ]

        sales = described_class.build(sales_to_build)

        expect(sales.first.merchant.id).to eql merchant.id
      end

      it '.address returns the purchase merchant address' do
        expect(sales.first.merchant.address).to eql '987 Fake St'
        expect(sales.second.merchant.address).to eql '456 Unreal Rd'
      end

      it '.name returns the purchase merchante name' do
        expect(sales.first.merchant.name).to eql "Bob's Pizza"
        expect(sales.second.merchant.name).to eql "Tom's Awesome Shop"
      end
    end
  end
end
