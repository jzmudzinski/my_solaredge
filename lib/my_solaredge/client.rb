# frozen_string_literal: true

require 'httparty'

module MySolaredge
  # The main object from where everything else happens
  class Client
    IMPLEMENTED_ENDPOINTS = %i[energy energy_details power overview sites time_frame_energy].freeze

    def initialize(credentials_source)
      @credentials_source = credentials_source
    end

    def credentials
      @credentials ||= CredentialGetter.new(@credentials_source)
    end

    def api_key
      credentials.api_key
    end

    def site_id
      credentials.site_id || sites.first_site_id
    end

    IMPLEMENTED_ENDPOINTS.each do |endpoint|
      define_method endpoint.to_s do |options = {}|
        klass = Object.const_get("MySolaredge::Request::#{endpoint.camelize}")
        request = klass.new(api_key, site_id, options)
        response_klass = Object.const_get("MySolaredge::Response::#{endpoint.camelize}")
        response_klass.new(request.call)
      end
    end

  end
end
