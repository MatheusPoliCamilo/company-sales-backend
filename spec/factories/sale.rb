FactoryBot.define do
  factory :sale do
    purchaser_name { 'João Silva' }
    item_description { 'R$10 off R$20 of food' }
    item_price { 10.0 }
    purchase_count { 2 }

    company_sale
  end
end
