# frozen_string_literal: true

require 'forwardable'

module MySolaredge
  module Response
    class TimeFrameEnergy < AbstractResponse
      def value
        @parsed_response["energy"]
      end
    end
  end
end
