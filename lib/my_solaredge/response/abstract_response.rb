# frozen_string_literal: true

require 'forwardable'

module MySolaredge
  module Response
    # Make response a bit easier to deal with in Ruby
    class AbstractResponse
      attr_reader :raw_response

      extend Forwardable

      def_delegators :@parsed_response, :[]

      def initialize(raw_response)
        @raw_response = raw_response # responses are of the format {endpoint_name: { actual_data }}
        parse if ok?
      end

      def ok?
        raw_response.ok?
      end

      def parse
        @parsed_response = recursive_parse(useful_body_data)
      end

      def useful_body_data
        JSON.parse(raw_response.body).values.first
      end

      private

      def recursive_parse(original)
        case original
        when Hash
          original.transform_values do |value|
            clever_parse(value)
          end
        when Array
          original.map do |value|
            clever_parse(value)
          end
        end
      end

      def clever_parse(value)
        if value.is_a?(Hash) || value.is_a?(Array)
          recursive_parse(value)
        elsif date_string?(value)
          Date.parse(value)
        elsif datetime_string?(value)
          DateTime.parse(value)
        else
          value
        end
      end

      # Try to identify dates
      def datetime_string?(value)
        value.is_a?(String) &&
          value.length == 19 &&
          /[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/.match(value)
      end

      def date_string?(value)
        value.is_a?(String) &&
          value.length == 10 &&
          /[0-9]{4}-[0-9]{2}-[0-9]{2}/.match(value)
      end
    end
  end
end
