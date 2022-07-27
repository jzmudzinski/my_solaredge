# frozen_string_literal: true

module MySolaredge
  module Request
    # Display the site overview data, including last year, last month and current energy
    class Overview < AbstractRequest
      def endpoint
        "/site/#{@site_id}/overview"
      end
    end
  end
end
