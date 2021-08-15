require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe '.sale' do
    it { is_expected.to belong_to(:sale).required }
  end
end
