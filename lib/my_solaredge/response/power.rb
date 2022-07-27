# frozen_string_literal: true

require 'forwardable'

module MySolaredge
  module Response
    class Power < AbstractResponse
      def values
        @parsed_response["values"]
      end
    end
  end
end
