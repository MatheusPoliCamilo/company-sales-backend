require 'rails_helper'

RSpec.describe CompanySale, type: :model do
  describe '#sales' do
    it { is_expected.to have_many(:sales).inverse_of(:company_sale).dependent(:destroy) }
  end
end
