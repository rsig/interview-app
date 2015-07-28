module Carts
  class V1 < Grape::API
    resource :carts do
      # POST /api/v1/carts
      desc 'Creates new Cart'
      post do
        Cart.create()
      end

      params do
        requires :id, type: Integer, desc: "Cart ID"
      end
      route_param :id do

        before do
          @cart = Cart.find(permitted_params[:id])
        end

        # GET /api/v1/carts/:id
        desc 'Returns Cart for :id'
        get do
          @cart
        end

        resource :line_items do
          # POST /api/v1/line_items
          desc 'Adds Product to Cart'
          params do
            requires :product_id, type: Integer, desc: "Product ID"
          end
          post do
            product = Product.find(permitted_params[:product_id])
            @cart.line_items.create!(:product => product)
          end

          route_param :id do
            before do
              @cart = Cart.find(permitted_params[:id])
            end

            # GET /api/v1/carts/:id
            desc 'Returns Cart for :id'
            get do
              @cart
            end
          end
        end # resource :line_items

      end
    end
  end
end
