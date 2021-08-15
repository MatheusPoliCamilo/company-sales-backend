require 'rails_helper'

RSpec.describe SalesSerializer do
  let(:sale) { build_stubbed :sale }

  it 'returns a json' do
    expected = {
      id: sale.id,
      purchaser_name: sale.purchaser_name,
      item_description: sale.item_description,
      item_price: sale.item_price,
      purchase_count: sale.purchase_count,
      company_sale: {
        id: sale.company_sale.id,
        imported_at: sale.company_sale.imported_at,
        total_gross_income: sale.company_sale.total_gross_income
      }
    }.to_json

    subject = described_class.new(sale)
    expect(subject.to_json).to eql expected
  end
end
