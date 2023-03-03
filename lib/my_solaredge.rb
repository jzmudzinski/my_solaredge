# frozen_string_literal: true

Dir["#{File.dirname(__FILE__)}/my_solaredge/**/*.rb"].each {|file| require file }

# require_relative "my_solaredge/client"
# require_relative "my_solaredge/credential_getter"
# require_relative "my_solaredge/version"
# require_relative "my_solaredge/request/abstract_request"
# require_relative "my_solaredge/request/energy"
# require_relative "my_solaredge/request/details"
# require_relative "my_solaredge/request/energy_details"
# require_relative "my_solaredge/request/overview"
# require_relative "my_solaredge/request/power"
# require_relative "my_solaredge/request/power_details"
# require_relative "my_solaredge/request/sites"
# require_relative "my_solaredge/request/time_frame_energy"
# require_relative "my_solaredge/request/current_power_flow"
# require_relative "my_solaredge/response/abstract_response"
# require_relative "my_solaredge/response/energy"
# require_relative "my_solaredge/response/details"
# require_relative "my_solaredge/response/energy_details"
# require_relative "my_solaredge/response/overview"
# require_relative "my_solaredge/response/power"
# require_relative "my_solaredge/response/power_details"
# require_relative "my_solaredge/response/sites"
# require_relative "my_solaredge/response/time_frame_energy"
# require_relative "my_solaredge/response/current_power_flow"

# Caling `new` creates a Client
module MySolaredge
  class Error < StandardError; end

  def self.new(...)
    Client.new(...)
  end
end
