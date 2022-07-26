# frozen_string_literal: true

module MySolaredge
  # Gets credentials from a source, either YAML or a string
  class CredentialGetter
    class InvalidSourceError < StandardError; end
    class SiteIdNotAnIntegerError < StandardError; end
    require 'yaml'
    attr_reader :data

    def initialize(data_source)
      case data_source.class.to_s
      when 'Hash'
        load_hash(data_source)
      when 'String'
        load_file(data_source)
      else
        raise InvalidSourceError
      end
    end

    def site_id
      data["site_id"]
    end

    def api_key
      data["api_key"]
    end

    private

    def load_file(source_file)
      @data = YAML.load_file(source_file)
    end

    def load_hash(hash)
      @data = hash.transform_keys(&:to_s)
      begin
        @data["site_id"] = Integer(@data["site_id"]) if @data["site_id"]
      rescue ArgumentError
        raise SiteIdNotAnIntegerError
      end
    end
  end
end
