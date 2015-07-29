require 'airborne'
require 'rails_helper'

describe Carts::V1 do
  describe '/api/v1/carts' do
    describe "POST" do
      it "creates a Cart" do
        expect{ post '/api/v1/carts' }.to change(Cart, :count).by(1)
        expect(response).to be_success
        expect_json_types('cart', :object)
        expect_json('cart.id', Cart.last.id)
      end
    end
  end

  describe '/api/v1/carts/:id' do
    let!(:cart) { FactoryGirl.create(:cart) }

    describe "DELETE" do
      it "destory Cart with given id" do
        expect{
          delete "/api/v1/carts/#{cart.id}"
        }.to change(Cart, :count).by(-1)
        expect(response).to be_success
        expect_json('status', 'success')
      end
    end

    describe "GET" do
      it "returns cart with line items and total price" do
        get "/api/v1/carts/#{cart.id}"
        expect(response).to be_success
        expect_json_types('cart', :object)
        expect_json('cart.id', cart.id)
        expect_json_types('cart.line_items', :array)
        expect_json_types('cart.total_price', :integer)
      end

      it "errors if id is invalid" do
        get "/api/v1/carts/abcdef"
        expect(response).to_not be_success
      end
    end
  end # /api/v1/carts/:id

  describe '/api/v1/carts/:id/orders' do
    let!(:cart) { FactoryGirl.create(:cart) }

    describe "POST" do
      let(:order_params) {{
        name: "Someone's Order",
        address: '123 Maple Lane, Somewhere HI, 09876',
        email: 'buyer@example.com',
        pay_type: 'Credit card'
      }}

      it "creates an Order with valid params" do
        expect{
          post "/api/v1/carts/#{cart.id}/orders", {order: order_params}
          expect(response).to be_success
        }.to change(Order, :count).by(1)
      end

      %i(name address email pay_type).each do |missing_param|
        it "does not create an Order if missing #{missing_param}" do
          order_params.delete(missing_param)
          expect{
            post "/api/v1/carts/#{cart.id}/orders", {order: order_params}
            expect(response).to_not be_success
          }.to_not change(Order, :count)
        end
      end
    end
  end
end
