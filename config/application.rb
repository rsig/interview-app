require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_model/serializer'

Bundler.require(*Rails.groups)

module InterviewApp
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'
    config.paths.add 'app/api', glob: '**/*.rb'
    config.autoload_paths += Dir["#{Rails.root}/app/api/*"]

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins 'localhost:4200', '127.0.0.1:4200', /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/, /.+\.local:4200/
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end

      allow do
        origins '*'
        resource '/api/v1/resource_goes_here*', headers: :any, methods: [:post]
      end
    end
    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.test_framework :rspec, fixture: true, views: false
      g.fixture_replacement :factory_girl, dir: 'spec/support/factories'
    end
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.active_record.raise_in_transactional_callbacks = true
  end
end
