class SalesSerializer < ActiveModel::Serializer
  attributes :id, :purchaser_name, :item_description, :item_price, :purchase_count

  belongs_to :company_sale, serializer: CompanySalesSerializer
end
