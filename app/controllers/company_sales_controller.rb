class CompanySalesController < ApplicationController
  before_action :set_company_sale, only: [:show, :update, :destroy]

  # GET /company_sales
  def index
    @company_sales = CompanySale.all

    render json: @company_sales
  end

  # GET /company_sales/1
  def show
    render json: @company_sale
  end

  # POST /company_sales
  def create
    @company_sale = CompanySale.new(company_sale_params)

    if @company_sale.save
      render json: @company_sale, status: :created, location: @company_sale
    else
      render json: @company_sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_sales/1
  def update
    if @company_sale.update(company_sale_params)
      render json: @company_sale
    else
      render json: @company_sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_sales/1
  def destroy
    @company_sale.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company_sale
    @company_sale = CompanySale.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def company_sale_params
    params.require(:company_sale).permit(:imported_at, :total_gross_income)
  end
end
