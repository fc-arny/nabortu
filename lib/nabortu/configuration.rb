module Nabortu
  class Configuration
    OPTIONS = [:url, :payment_url, :login, :password, :partner_id]
    attr_accessor *OPTIONS
  end
end