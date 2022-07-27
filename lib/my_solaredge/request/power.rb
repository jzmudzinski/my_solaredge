# frozen_string_literal: true

module MySolaredge
  module Request
    # Return the site power measurements in 15 minutes resolution. Max 1 month period
    class Power < AbstractRequest
      def endpoint
        "/site/#{@site_id}/power"
      end

      def params
        {
          "startTime" => start_time,
          "endTime" => end_time,
        }
      end

      private

      def start_time
        convert_datetime(@options[:start_time])
      end

      def end_time
        convert_datetime(@options[:end_time])
      end
    end
  end
end
