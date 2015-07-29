module Orders
  class V1 < Grape::API
    resource :orders do
      params do
        requires :id, type: Integer, desc: "Cart ID"
      end
      route_param :id do
        # GET /api/v1/orders/:id
        desc 'Returns an Order'
        get do
          Order.find permitted_params[:id]
        end
      end # route_param :id do
    end # resource :orders
  end
end
