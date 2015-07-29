source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'rails-api', require: 'rails-api/action_controller/api'
gem 'grape', '~>0.12.0'
gem 'active_model_serializers', '0.9.3'
gem 'grape-active_model_serializers', '~>1.3.2'
gem 'hashie', "~> 3.4.2"
# fixes ActiveModel::ForbiddenAttributesError with hashie
gem "hashie-forbidden_attributes", "~>0.1.1"
gem 'devise'

gem 'pg', '~> 0.18.1'
# gem "redis-store", "~> 1.1.5"

group :assets do
  gem 'therubyracer', platforms: :ruby
end

group :development do
  gem 'foreman'
  gem 'rubocop'
  gem 'spring'
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-nav"
  gem "pry-rails"
  gem "pry-stack_explorer"
  gem "pry-theme"
  # bulk import
  gem 'activerecord-import'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'faker'
  gem 'byebug'
  gem 'spring-commands-rspec', '~> 1.0.2'
end

group :test do
  gem 'rspec-rails', '~> 3.2.0'
  gem 'rspec-mocks', '~> 3.2.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'airborne', '~> 0.1.15'
end
