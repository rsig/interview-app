source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'rails-api', require: 'rails-api/action_controller/api'
gem 'grape', '~>0.12.0'
gem "active_model_serializers", '0.9.3'
gem "grape-active_model_serializers", '~>1.3.2'

gem 'pg', "~> 0.18.1"
# gem "redis-store", "~> 1.1.5"

group :assets do
  gem 'therubyracer', platforms: :ruby
end

group :development do
  gem "foreman"
  gem "rubocop"
  gem 'spring'

  # bulk import
  gem 'activerecord-import', :require => false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.2.0'
  gem 'rspec-mocks', '~> 3.2.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.3.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'spring-commands-rspec', '~> 1.0.2'
end
