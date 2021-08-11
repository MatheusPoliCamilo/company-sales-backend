require 'rails_helper'

RSpec.describe CompanySalesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/company_sales').to route_to('company_sales#index')
    end

    it 'routes to #show' do
      expect(get: '/company_sales/1').to route_to('company_sales#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/company_sales').to route_to('company_sales#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/company_sales/1').to route_to('company_sales#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/company_sales/1').to route_to('company_sales#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/company_sales/1').to route_to('company_sales#destroy', id: '1')
    end
  end
end
