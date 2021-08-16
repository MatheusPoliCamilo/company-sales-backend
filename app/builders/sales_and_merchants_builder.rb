class SalesAndMerchantsBuilder < ApplicationBuilder
  def initialize(sales_and_merchants_to_build)
    @sales_and_merchants_to_build = sales_and_merchants_to_build
  end

  def build
    @sales_and_merchants_to_build.map do |sale_and_merchant_to_build|
      Sale.new(
        purchaser_name: sale_and_merchant_to_build['purchaser name'],
        item_description: sale_and_merchant_to_build['item description'],
        item_price: sale_and_merchant_to_build['item price'],
        purchase_count: sale_and_merchant_to_build['purchase count'],
        merchant: build_merchant(sale_and_merchant_to_build)
      )
    end
  end

  private

  def build_merchant(merchant_to_build)
    merchant_name = merchant_to_build['merchant name']
    existent_merchant = Merchant.find_by(name: merchant_name)

    return existent_merchant if existent_merchant.present?

    Merchant.new(
      name: merchant_name,
      address: merchant_to_build['merchant address']
    )
  end
end
