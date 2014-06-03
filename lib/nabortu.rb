require 'nabortu/version'

require 'active_support'
require 'active_support/all'
require 'support/hash'

require 'nabortu/client'
require 'nabortu/errors'
require 'nabortu/configuration'

module Nabortu
  class << self
    attr_writer :config

    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end

    def client
      Nabortu::Client.new
    end
  end
end
