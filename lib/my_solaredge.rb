# frozen_string_literal: true

require_relative "my_solaredge/client"
require_relative "my_solaredge/credential_getter"
require_relative "my_solaredge/version"
require_relative "my_solaredge/request/abstract_request"
require_relative "my_solaredge/request/energy"
require_relative "my_solaredge/request/sites"
require_relative "my_solaredge/response/abstract_response"
require_relative "my_solaredge/response/energy"
require_relative "my_solaredge/response/sites"

# Caling `new` creates a Client
module MySolaredge
  class Error < StandardError; end

  def self.new(...)
    Client.new(...)
  end
end
