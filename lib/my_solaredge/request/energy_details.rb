# frozen_string_literal: true

module MySolaredge
  module Request
    # Detailed site energy measurements from meters such as consumption, export (feed-in), import (purchase), etc.
    class EnergyDetails < AbstractRequest
      ALLOWED_UNITS = %w[QUARTER_OF_AN_HOUR HOUR DAY WEEK MONTH YEAR].freeze

      def endpoint
        unless time_unit.nil? || ALLOWED_UNITS.include?(time_unit)
          raise ArgumentError, "time_unit must be one of: #{ALLOWED_UNITS.join(", ")}"
        end

        "/site/#{@site_id}/energyDetails"
      end

      def params
        {
          "startTime" => start_time,
          "endTime" => end_time,
        }.merge(
          time_unit.nil? ? {} : { "timeUnit" => time_unit },
        ).merge(
          meters.nil? ? {} : { "meters" => meters },
        )
      end

      private

      def time_unit
        @options[:time_unit]&.to_s&.upcase
      end

      def start_time
        convert_datetime(@options[:start_time])
      end

      def end_time
        convert_datetime(@options[:end_time])
      end

      def meters
        @options[:meters] # Must be comma-separated String
      end
    end
  end
end
