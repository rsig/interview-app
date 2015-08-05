module Carts
  class V1 < Grape::API
    resource :carts do
      # POST /api/v1/carts
      desc 'Creates new Cart'
      post do
        Cart.create()
      end

      desc "List all the carts"
      get do
        Cart.all
      end

      params do
        requires :cart_id, type: Integer, desc: "Cart ID"
      end
      route_param :cart_id do

        before do
          @cart = Cart.find(permitted_params[:cart_id])
        end

        # GET /api/v1/carts/:id
        desc 'Returns Cart for :id'
        get do
          @cart
        end


        # DELETE /api/v1/carts/:id
        desc 'Empties Cart'
        delete do
          @cart.destroy!
          {status: 'success'}
        end

        resource :line_items do
          # POST /api/v1/cart/:id/line_items
          desc 'Adds Product to Cart'
          params do
            requires :product_id, type: Integer, desc: "Product ID"
          end
          post do
            li = @cart.add_product(permitted_params[:product_id])
            li.save!
            @cart
          end

          params do
            requires :cart_id, type: Integer, desc: "Cart ID"
          end
          route_param :cart_id do
            before do
              @cart = Cart.find(permitted_params[:cart_id])
            end

            # GET /api/v1/carts/:id/line_items/:id
            desc 'Returns Line Item for :id'
            get do
              @cart.line_items.find(permitted_params[:cart_id])
            end
          end
        end # resource :line_items

        resource :orders do
          # POST /api/v1/carts/:id/orders
          desc 'Creates an Order from items in Cart'
          params do
            optional :order, type: Hash do
              requires :name, type: String
              requires :address, type: String
              requires :email, type: String
              requires :pay_type, type: String, values: Order::PAYMENT_TYPES
            end
          end
          post do
            puts permitted(:order).inspect
            order = Order.new(permitted(:order))
            order.add_line_items_from_cart(@cart)
            order.save!

            order
          end
        end
      end
    end
  end
end
