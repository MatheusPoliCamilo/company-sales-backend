require 'rails_helper'

RSpec.describe API::V1::SalesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      create(:sale)
      get :index, as: :json

      expect(response).to be_successful
    end

    it 'returns a list of sales' do
      sale1 = create(:sale)
      sale2 = create(:sale)
      get :index, as: :json

      expect(response.body).to eql [SalesSerializer.new(sale1), SalesSerializer.new(sale2)].to_json
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      sale = create(:sale)
      get :show, params: { id: sale.id }, as: :json

      expect(response).to be_successful
    end

    it 'returns the specified sale as JSON' do
      sale = create(:sale)
      get :show, params: { id: sale.id }, as: :json

      expect(response.body).to eql SalesSerializer.new(sale).to_json
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Sale' do
        company_sale = create(:company_sale)
        sale = build(:sale, company_sale: company_sale)

        expect do
          post :create, params: sale.attributes, as: :json
        end.to change(Sale, :count).by(1)
      end

      it 'returns a JSON response with the new sale' do
        company_sale = create(:company_sale)
        sale = build(:sale, company_sale: company_sale)
        post :create, params: sale.attributes, as: :json

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to eql SalesSerializer.new(Sale.last).to_json
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Sale' do
        expect do
          post :create, params: {}, as: :json
        end.to change(Sale, :count).by(0)
      end

      it 'renders a JSON response with errors for the new sale' do
        post :create, params: {}, as: :json

        sale = Sale.new
        sale.valid?

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to eql sale.errors.to_json
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested sale' do
      sale = create(:sale)

      expect do
        delete :destroy, params: { id: sale.id }, as: :json
      end.to change(Sale, :count).by(-1)
    end
  end
end
