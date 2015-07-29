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
  end
end
