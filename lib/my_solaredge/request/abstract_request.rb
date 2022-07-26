# frozen_string_literal: true

require 'httparty'

module MySolaredge
  module Request
    # Sends requests to solaredges's main API
    class AbstractRequest
      include HTTParty
      base_uri "https://monitoringapi.solaredge.com"

      def initialize(api_key, site_id, options)
        @api_key = api_key
        @site_id = site_id
        @options = options
      end

      def call
        puts "Calling #{endpoint} with #{base_params.merge(params)}" if @options[:debug]
        self.class.public_send(
          method, endpoint,
          query: base_params.merge(params),
        )
      end

      def base_params
        {
          "api_key" => @api_key,
        }
      end

      def params
        {}
      end

      def method
        :get
      end

      # is this needed?
      def klass_name
        self.class.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
      end

      def body
        nil
      end

      def convert_date(date)
        Date.parse(date.to_s).strftime('%Y-%m-%d')
      end

      def convert_datetime(date)
        DateTime.parse(date.to_s).strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end
