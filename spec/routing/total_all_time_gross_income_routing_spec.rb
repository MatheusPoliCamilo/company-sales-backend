require 'rails_helper'

RSpec.describe API::V1::TotalAllTimeGrossIncomeController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/total_all_time_gross_income').to route_to('api/v1/total_all_time_gross_income#index')
    end

    it 'does not routes to #show' do
      expect(get: '/api/v1/total_all_time_gross_income/1').not_to route_to('api/v1/total_all_time_gross_income#show', id: '1')
    end

    it 'does not routes to #create' do
      expect(post: '/api/v1/total_all_time_gross_income').not_to route_to('api/v1/total_all_time_gross_income#create')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/api/v1/total_all_time_gross_income/1').not_to route_to('api/v1/total_all_time_gross_income#destroy', id: '1')
    end

    it 'does not route to #update via PUT' do
      expect(put: '/api/v1/total_all_time_gross_income/1').not_to route_to('api/v1/total_all_time_gross_income#update', id: '1')
    end

    it 'does not route to #update via PATCH' do
      expect(patch: '/api/v1/total_all_time_gross_income/1').not_to route_to('api/v1/total_all_time_gross_income#update', id: '1')
    end
  end
end
