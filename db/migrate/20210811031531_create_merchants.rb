class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants, id: :serial do |t|
      t.string :name
      t.string :address
      t.references :sale, null: false, index: true

      t.timestamps
    end
  end
end
