class API::V1::TotalAllTimeGrossIncomeController < ApplicationController
  # GET /api/v1/total_all_time_gross_income
  def index
    render json: Sale.all.sum(&:item_price).to_d.to_s
  end
end
