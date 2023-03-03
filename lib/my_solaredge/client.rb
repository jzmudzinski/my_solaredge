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

    # IMPLEMENTED_ENDPOINTS.each do |endpoint|
    #   define_method endpoint.to_s do |options = {}|
    #     klass = Object.const_get("MySolaredge::Request::#{camelize(endpoint)}")
    #     request = klass.new(api_key, site_id, options)
    #     response_klass = Object.const_get("MySolaredge::Response::#{camelize(endpoint)}")
    #     response_klass.new(request.call)
    #   end
    # end

    def sites
      request = MySolaredge::Request::Sites.new(api_key)
      MySolaredge::Response::Sites.new(request.call)
    end

    def energy(options = {})
      request = MySolaredge::Request::Energy.new(api_key, site_id, options)
      MySolaredge::Response::Energy.new(request.call)
    end

    def energy_details(options = {})
      request = MySolaredge::Request::EnergyDetails.new(api_key, site_id, options)
      MySolaredge::Response::EnergyDetails.new(request.call)
    end

    def power(options = {})
      request = MySolaredge::Request::Power.new(api_key, site_id, options)
      MySolaredge::Response::Power.new(request.call)
    end

    def power_details(options = {})
      request = MySolaredge::Request::PowerDetails.new(api_key, site_id, options)
      MySolaredge::Response::PowerDetails.new(request.call)
    end

    def overview(options = {})
      request = MySolaredge::Request::Overview.new(api_key, site_id, options)
      MySolaredge::Response::Overview.new(request.call)
    end

    def details(options = {})
      request = MySolaredge::Request::Details.new(api_key, site_id, options)
      MySolaredge::Response::Details.new(request.call)
    end

    def time_frame_energy(options = {})
      request = MySolaredge::Request::TimeFrameEnergy.new(api_key, site_id, options)
      MySolaredge::Response::TimeFrameEnergy.new(request.call)
    end

    private

    def camelize(string)
      string.to_s.split('_').collect(&:capitalize).join
    end
  end
end
