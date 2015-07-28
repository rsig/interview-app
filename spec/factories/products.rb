FactoryGirl.define do
  factory :product do
    title       { Faker::Commerce.product_name }
    description { Faker::Company.bs }
    image_url 'something.png'
    price '9.99'
  end
end
