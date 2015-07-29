class AddQuantityAndPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :integer, default: 1
    add_column :line_items, :price, :decimal
  end
end
