# frozen_string_literal: true

require 'forwardable'

module MySolaredge
  module Response
    # Calls the /sites endpoint
    class Sites < AbstractResponse
      def first_site_id
        raw_response.dig("sites", "site").first["id"]
      end
    end
  end
end
