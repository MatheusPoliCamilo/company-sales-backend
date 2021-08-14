require 'rails_helper'

RSpec.describe API::V1::CompanySalesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/company_sales').to route_to('api/v1/company_sales#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/company_sales/1').to route_to('api/v1/company_sales#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/company_sales').to route_to('api/v1/company_sales#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/company_sales/1').to route_to('api/v1/company_sales#destroy', id: '1')
    end

    it 'does not route to #update via PUT' do
      expect(put: '/api/v1/company_sales/1').not_to route_to('api/v1/company_sales#update', id: '1')
    end

    it 'does not route to #update via PATCH' do
      expect(patch: '/api/v1/company_sales/1').not_to route_to('api/v1/company_sales#update', id: '1')
    end
  end
end
