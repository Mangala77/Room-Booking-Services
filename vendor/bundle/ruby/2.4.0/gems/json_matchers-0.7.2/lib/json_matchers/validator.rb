require "json-schema"
require "json_matchers/payload"

module JsonMatchers
  class Validator
    def initialize(options:, response:, schema_path:)
      @options = options.dup
      @payload = Payload.new(response).to_s
      @schema_path = schema_path.to_s
    end

    def validate!
      if recording_errors?
        validate_recording_errors
      else
        validate
      end
    end

    private

    attr_reader :options, :payload, :schema_path

    def recording_errors?
      options.fetch(:record_errors, false)
    end

    def validate_recording_errors
      JSON::Validator.fully_validate(schema_path, payload, options)
    end

    def validate
      JSON::Validator.validate!(schema_path, payload, options)

      []
    end
  end
end
