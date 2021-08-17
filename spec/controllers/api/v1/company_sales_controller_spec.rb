require 'rails_helper'

RSpec.describe API::V1::CompanySalesController, type: :controller do
  let(:invalid_attributes) do
    { imported_at: nil }
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: create(:company_sale).attributes, as: :json

      expect(response).to be_successful
    end

    it 'returns a list of company_sales' do
      company_sale1 = create(:company_sale)
      company_sale2 = create(:company_sale)
      get :index, params: {}, as: :json

      expect(response.body).to eql [
        CompanySalesSerializer.new(company_sale1),
        CompanySalesSerializer.new(company_sale2)
      ].to_json
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      company_sale = create(:company_sale)
      get :show, params: { id: company_sale.id }, as: :json

      expect(response).to be_successful
    end

    it 'returns the specified company sale as JSON' do
      company_sale = create(:company_sale)
      get :show, params: { id: company_sale.id }, as: :json

      expect(response.body).to eql(CompanySalesSerializer.new(company_sale).to_json)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        { file: File.read('spec/fixtures/example_input.tab') }
      end

      it 'creates a new company_sale' do
        expect do
          post :create, params: valid_params, as: :json
        end.to change(CompanySale, :count).by(1)
      end

      it 'returns a JSON response with the new company_sale' do
        post :create, params: valid_params, as: :json

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to eql CompanySalesSerializer.new(CompanySale.last).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        { file_path: 'spec/fixtures/file_without_sales.tab' }
      end

      it 'does not create a new CompanySale' do
        expect do
          post :create, params: invalid_params, as: :json
        end.to change(CompanySale, :count).by(0)
      end

      it 'returns a JSON response with errors for the new company_sale' do
        post :create, params: invalid_params, as: :json

        company_sale = CompanySale.new(imported_at: Time.current)
        company_sale.valid?

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to eql company_sale.errors.to_json
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested company_sale' do
      company_sale = create(:company_sale)

      expect do
        delete :destroy, params: { id: company_sale.id }, as: :json
      end.to change(CompanySale, :count).by(-1)
    end
  end
end
