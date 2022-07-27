# frozen_string_literal: true

module MySolaredge
  module Request
    # Return the site total energy produced for a given period
    class TimeFrameEnergy < AbstractRequest
      def endpoint
        "/site/#{@site_id}/timeFrameEnergy"
      end

      def params
        {
          "startDate" => start_date,
          "endDate" => end_date,
        }
      end

      private

      def start_date
        convert_date(@options[:start_date])
      end

      def end_date
        convert_date(@options[:end_date])
      end
    end
  end
end
