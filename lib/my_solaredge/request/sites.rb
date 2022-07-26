# frozen_string_literal: true

module MySolaredge
  module Request
    # Returns a list of sites related to the given token.
    class Sites < AbstractRequest
      def endpoint
        "/sites/list"
      end
    end
  end
end
