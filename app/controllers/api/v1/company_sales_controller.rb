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
    file = File.open(company_sale_params[:file_path])
    company_sale = CompanySale.new(
      imported_at: Time.current,
      sales: SalesAndMerchantsBuilder.build(ReadDataFromTabFile.call(file))
    )

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
    params.permit(:file_path)
  end
end
