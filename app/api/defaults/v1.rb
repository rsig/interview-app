module Defaults
  module V1
    extend ActiveSupport::Concern

    included do
      version 'v1', using: :path
      default_format :json
      # Adds support for the extension `.json`: https://github.com/intridea/grape/pull/809
      # Might change in future where this is not needed
      content_type :json, 'application/json'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      helpers do
        def permitted_params
          @permitted_params ||= declared(params, include_missing: false)
        end

        def permitted(key)
          @permitted ||= declared(params, include_missing: false)[key]
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        Rails.logger.debug "response: Record not found.\n\t#{e.inspect}\n#{e.backtrace.join("\n")}"
        error_response(message: 'Record not found.', status: 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        Rails.logger.debug "response: Record invalid.\n\t#{e.inspect}\n#{e.backtrace.join("\n")}"
        # Airbrake.notify_or_ignore(e)
        error_response(message: "Record invalid. #{e.message}", status: 422)
      end
    end
  end
end
