require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe '#company_sales' do
    it { is_expected.to belong_to(:company_sale) }
  end
end
