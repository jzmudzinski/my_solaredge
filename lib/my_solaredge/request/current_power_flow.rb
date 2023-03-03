# frozen_string_literal: true

module MySolaredge
  module Request
    # Return the site total energy produced for a given period
    class CurrentPowerFlow < AbstractRequest
      def endpoint
        "/site/#{@site_id}/currentPowerFlow"
      end
    end
  end
end
