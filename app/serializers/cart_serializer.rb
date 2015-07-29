class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_price
  has_many :line_items
end
