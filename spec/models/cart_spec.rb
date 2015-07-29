require 'rails_helper'

describe Cart do
  let(:cart) {Cart.create!()}
  let(:product) { FactoryGirl.create(:product, price: 2.50)}

  describe 'add product' do
    it "creates new line item in cart if product is not in cart" do
      expect {
        cart.add_product(product.id)
      }.to change{cart.line_items.size}.by(1)
      li = cart.line_items.first
      expect(li.product).to eq product
      expect(li.quantity).to eq 1
    end

    it "increments line item quantity in cart if product is already in cart" do
      cart.add_product(product.id)
      cart.save
      expect {
        @li = cart.add_product(product.id)
      }.to_not change{cart.line_items.size}
      expect(@li.product).to eq product
      expect(@li.quantity).to eq 2
    end
  end

  describe 'total price' do
    it "sums up price of all products with the quantity" do
      new_product = FactoryGirl.create(:product, price: 3.00)
      1.upto(2) do
        cart.add_product(product.id)
      end
      cart.add_product(new_product.id)
      cart.save

      expect(cart.total_price).to eq 8.00
    end
  end
end
