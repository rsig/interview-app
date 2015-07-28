source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'rails-api', require: 'rails-api/action_controller/api'
gem 'grape', '0.10.1'
gem 'active_model_serializers', '0.9.3'
gem 'grape-active_model_serializers', '~>1.3.2'
gem 'rake', '>= 10.1.1'
gem 'pg', '~> 0.18.1'
gem 'rack-attack', '~> 3.0.0'
gem 'rack-cors', '~> 0.2.9'
gem 'rack-ssl-enforcer', '~> 0.2.6'
gem 'redis-store', '~> 1.1.5'

# Utils
gem 'carrierwave'
gem 'carrierwave-aws'
gem 'retryable'
gem 'addressable'
gem 'awesome_print'
gem 'mini_magick'
gem 'better',  require: 'better/tempfile'
gem 'sinatra', require: nil

group :assets do
  gem 'execjs'
  gem 'therubyracer', platforms: :ruby
end

group :development do
  gem 'foreman'
  gem 'spring', '~> 1.1.2'
  gem 'puma', '~> 2.8.1'
  gem 'passenger', '~> 5.0.0.rc2'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-theme'
  gem 'rails-erd'
  gem 'mailcatcher'
  gem 'rubocop'
end

group :test, :development do
  gem 'rspec-rails', '~> 3.2.0'
  gem 'rspec-mocks', '~> 3.2.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.3.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'dotenv-rails'
  gem 'simplecov', '~> 0.10.0', require: false
  gem 'yarjuf'
  gem 'airborne', '>= 0.1.11'
  gem 'test_after_commit'
  gem 'timecop'
  gem 'simplecov-rcov', '~> 0.2.3'
end
