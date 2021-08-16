FactoryBot.define do
  factory :merchant do
    address { '987 Fake St' }
    name { "Bob's Pizza" }

    sale { association :sale, merchant: instance }
  end
end
