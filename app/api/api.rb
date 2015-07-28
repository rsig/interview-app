class API < Grape::API
  include Defaults::V1

  mount Products::V1
  mount Stores::V1
end
