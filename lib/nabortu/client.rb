Dir[File.dirname(__FILE__) + '/methods/*.rb'].each { |file| require file }

module Nabortu
  class Client
    def method_missing(name, params, args = {})
      klass = ['Nabortu', 'Methods', name.to_s.camelize].join('::')

      if Object.const_defined? klass
        klass.constantize.do_request(name, params)
      else
        raise Nabortu::Errors::WrongMethod.new("Nabortu API does not have '#{name}' method or it\'s not implemented")
      end
    end
  end
end