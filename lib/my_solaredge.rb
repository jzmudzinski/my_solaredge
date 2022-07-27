# frozen_string_literal: true

require_relative "my_solaredge/client"
require_relative "my_solaredge/credential_getter"
require_relative "my_solaredge/version"
require_relative "my_solaredge/request/abstract_request"
require_relative "my_solaredge/request/energy"
require_relative "my_solaredge/request/energy_details"
require_relative "my_solaredge/request/overview"
require_relative "my_solaredge/request/power"
require_relative "my_solaredge/request/sites"
require_relative "my_solaredge/request/time_frame_energy"
require_relative "my_solaredge/response/abstract_response"
require_relative "my_solaredge/response/energy"
require_relative "my_solaredge/response/energy_details"
require_relative "my_solaredge/response/overview"
require_relative "my_solaredge/response/power"
require_relative "my_solaredge/response/sites"
require_relative "my_solaredge/response/time_frame_energy"

# Caling `new` creates a Client
module MySolaredge
  class Error < StandardError; end

  def self.new(...)
    Client.new(...)
  end
end
