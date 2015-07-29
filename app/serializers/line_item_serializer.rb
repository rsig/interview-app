class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :total_price
end
