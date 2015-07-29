class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type
      
      t.references :line_items, index: true
      t.timestamps null: false
    end
  end
end
