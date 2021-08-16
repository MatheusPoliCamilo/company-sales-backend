require 'rails_helper'

RSpec.describe ReadDataFromTabFile do
  describe '#call' do
    it 'returns a hash from the parsing of a tab-separated file' do
      file = File.open('spec/fixtures/example_input.tab')

      expect(described_class.call(file)).to eql [
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
          'item price': '10.0',
          'purchase count': '5',
          'merchant address': '456 Unreal Rd',
          'merchant name': "Tom's Awesome Shop"
        }.with_indifferent_access
      ]
    end
  end
end
