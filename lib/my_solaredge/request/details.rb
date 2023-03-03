# frozen_string_literal: true

module MySolaredge
  module Request
    # Displays the site details, such as name, location, status, etc.
    class Details < AbstractRequest
      def endpoint
        "/site/#{@site_id}/details"
      end
    end
  end
end
