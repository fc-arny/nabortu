require 'nabortu/version'

require 'active_support'
require 'active_support/all'

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

    def client(options = {})
      Nabortu::Client.new options
    end
  end
end
