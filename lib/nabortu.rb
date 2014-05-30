require 'nabortu/version'

require 'active_support'
require 'active_support/all'

require 'nabortu/client'
require 'nabortu/errors'
require 'nabortu/configuration'

module Nabortu
  class << self
    attr_writer :config
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(config)
  end
end
