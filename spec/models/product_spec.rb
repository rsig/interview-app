require 'rails_helper'

describe Product do
  describe 'validations' do
    describe 'price' do
      it 'must be more than 0.00' do
        product = Product.new(title: 'something', description: 'something', price: 0.00, image_url: 'something.png')
        expect(product).to be_invalid

        product.price = 0.01
        expect(product).to be_valid

        product.price = 111.11
        expect(product).to be_valid
      end
    end
  end
end
