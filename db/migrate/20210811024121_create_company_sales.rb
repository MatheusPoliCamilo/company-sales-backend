class CreateCompanySales < ActiveRecord::Migration[6.0]
  def change
    create_table :company_sales, id: :serial do |t|
      t.date :imported_at
      t.float :total_gross_income

      t.timestamps
    end
  end
end
