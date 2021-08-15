class API::V1::SalesController < ApplicationController
  # GET /sales
  def index
    render json: Sale.all, each_serializer: SalesSerializer
  end

  # GET /sales/1
  def show
    render json: Sale.find(params[:id]), serializer: SalesSerializer
  end

  # POST /sales
  def create
    sale = Sale.new(sale_params)

    if sale.save
      render json: sale, status: :created, serializer: SalesSerializer
    else
      render json: sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sales/1
  def destroy
    Sale.find(params[:id]).destroy
  end

  private

  def sale_params
    params.permit(:purchaser_name, :item_description, :item_price, :purchase_count, :company_sale_id)
  end
end
