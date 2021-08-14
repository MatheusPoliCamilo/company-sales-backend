class CompanySalesSerializer < ActiveModel::Serializer
  attributes :id, :imported_at, :total_gross_income

  has_many :sales
end
