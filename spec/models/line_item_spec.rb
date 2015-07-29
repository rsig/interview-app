require 'rails_helper'

describe LineItem do
  describe "validations" do
    it "is invalid with quantity less than 0" do
      li = LineItem.new(quantity: -1)
      expect(li).to be_invalid
      li = LineItem.new(quantity: -1.333)
      expect(li).to be_invalid
    end

    it "is valid with quantity of 0" do
      li = LineItem.new(quantity: 0)
      expect(li).to be_valid
    end

    it "is valid with quantity greater 0" do
      li = LineItem.new(quantity: 1)
      expect(li).to be_valid

      li = LineItem.new(quantity: 10)
      expect(li).to be_valid
    end
  end

  describe "total_price" do
    it "is the total of product price and quantity" do
      product = FactoryGirl.create(:product, price: 1.50)
      li = LineItem.new(product: product, quantity: 3)
      expect(li.total_price).to eq 4.50
    end
  end
end
