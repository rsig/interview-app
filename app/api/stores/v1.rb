module Stores
  class V1 < Grape::API
    resource :stores do
      # GET /api/v1/stores
      desc "Returns all stores"
      get do
        Product.all
      end
    end
  end
end
