class API::V1::CompanySalesController < ApplicationController
  # GET /api/v1/company_sales
  def index
    render json: CompanySale.all, each_serializer: CompanySalesSerializer
  end

  # GET /api/v1/company_sales/1
  def show
    render json: CompanySale.find(params[:id]), serializer: CompanySalesSerializer
  end

  # POST /api/v1/company_sales
  def create
    company_sale = CompanySale.new(company_sale_params)

    if company_sale.save
      render json: company_sale, status: :created, serializer: CompanySalesSerializer
    else
      render json: company_sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/company_sales/1
  def destroy
    CompanySale.find(params[:id]).destroy
  end

  private

  def company_sale_params
    params.permit(:imported_at)
  end
end
