class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales, id: :serial do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.references :company_sale, null: false, index: true

      t.timestamps
    end
  end
end
