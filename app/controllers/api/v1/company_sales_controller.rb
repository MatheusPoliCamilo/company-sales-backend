class API::V1::CompanySalesController < ApplicationController
  # GET /api/v1/company_sales
  def index
    render json: CompanySale.all
  end

  # GET /api/v1/company_sales/1
  def show
    render json: CompanySale.find(params[:id])
  end

  # POST /api/v1/company_sales
  def create
    company_sale = CompanySale.new(company_sale_params)

    if company_sale.save
      render json: company_sale, status: :created
    else
      render json: company_sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/company_sales/1
  def update
    if company_sale.update(company_sale_params)
      render json: company_sale
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
    params.require(:company_sale).permit(:imported_at, :total_gross_income)
  end
end
