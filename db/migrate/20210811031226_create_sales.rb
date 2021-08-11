class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_address

      t.timestamps
    end
  end
end
