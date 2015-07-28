# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'activerecord-import'
ActiveRecord::Import.require_adapter(ActiveRecord::Base.configurations[Rails.env]['adapter'])

products = []
1.upto(1000) do |num|
  products << Product.new(
    title: "Random Item #{num}",
    description: "Something to sell #{rand(num * 100)}",
    image_url: 'http://www.google.com/ads/shopping/images/shopping-hero.png',
    price: rand(10_000) / 100.0 + 0.01
  )
end
Product.import products
