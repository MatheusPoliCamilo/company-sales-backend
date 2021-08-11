class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :merchant_name
      t.string :merchant_address

      t.timestamps
    end
  end
end
