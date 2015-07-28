module Products
  class V1 < Grape::API
    resource :products do
      # GET /api/v1/products
      desc 'Returns all products'
      get do
        Product.all
      end
    end
  end
end
