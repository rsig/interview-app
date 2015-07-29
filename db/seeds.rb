# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'activerecord-import'
ActiveRecord::Import.require_adapter(ActiveRecord::Base.configurations[Rails.env]['adapter'])

NUM_PRODUCTS=15000
NUM_CARTS=10
BATCHES=10_000


def log_result(results)
  if results.failed_instances.present?
    puts "~~#{results.failed_instances.count} fails. \n\nErrors: "
    puts results.failed_instances.first.errors.inspect
  else
    "successfully imported"
  end
end

puts "seeding Products"
products = []
1.upto(NUM_PRODUCTS) do |num|
  products << Product.new(
    title: "Random Item #{num}",
    description: "Something to sell #{rand(num * 100)}",
    image_url: 'http://www.google.com/ads/shopping/images/shopping-hero.png',
    price: rand(10_000) / 100.0 + 0.01
  )

  if num%BATCHES == 0
    puts "inserting batch of #{BATCHES} Products"
    log_result Product.import(products)
    products = []
  end
end
log_result Product.import(products)

puts "seeding Carts and LineItems"
line_items = []
1.upto(NUM_CARTS) do |num|
  cart = Cart.create()

  random_items = rand(10+3)
  1.upto(random_items) do
    line_items << cart.add_product(rand(NUM_PRODUCTS)+1)
  end

  if num%BATCHES == 0
    puts "inserting batch of #{BATCHES} LineItems"
    log_result LineItem.import(line_items)
    line_items = []
  end
end
puts "inserting batch of LineItems"
log_result LineItem.import(line_items)


puts "seeding Orders"
Cart.find_in_batches(batch_size: 50) do |carts|
  line_items = []
  # orders = []
  carts.each do |cart|
    order = Order.new(name: "Cart #{cart.id}", address: '123 Carty ln', email:"someone#{cart.id}@example.com", pay_type: "Credit card")
    # orders << order

    random_items = rand(10+3)
    1.upto(random_items) do
      line_items << order.line_items.build(product_id: rand(NUM_PRODUCTS)+1)
    end
    # line_items = order.add_line_items_from_cart(cart)
    order.save
  end
end
