class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, format: {
    with: /\.(gif|jpg|png)\Z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
