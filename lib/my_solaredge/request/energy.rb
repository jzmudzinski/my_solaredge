# frozen_string_literal: true

module MySolaredge
  module Request
    # Return the site energy measurements
    class Energy < AbstractRequest
      ALLOWED_UNITS = %w[QUARTER_OF_AN_HOUR HOUR DAY WEEK MONTH YEAR].freeze

      def endpoint
        unless ALLOWED_UNITS.include?(time_unit)
          raise ArgumentError, "time_unit must be one of: #{ALLOWED_UNITS.join(", ")}"
        end

        "/site/#{@site_id}/energy"
      end

      def params
        {
          "timeUnit" => time_unit,
          "startDate" => start_date,
          "endDate" => end_date,
        }
      end

      private

      def time_unit
        @options[:time_unit].to_s.upcase
      end

      def start_date
        convert_date(@options[:start_date])
      end

      def end_date
        convert_date(@options[:end_date])
      end
    end
  end
end
