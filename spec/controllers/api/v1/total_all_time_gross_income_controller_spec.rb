require 'rails_helper'

RSpec.describe API::V1::TotalAllTimeGrossIncomeController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, as: :json

      expect(response).to be_successful
    end

    it 'returns the company sales total all-time gross income' do
      sales = build_list(:sale, 3, item_price: 10.3)
      create(:company_sale, sales: sales)

      get :index, params: {}, as: :json

      expect(response.body).to eq '30.9'
    end
  end
end
