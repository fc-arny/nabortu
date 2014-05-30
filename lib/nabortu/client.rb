Dir[File.dirname(__FILE__) + '/methods/*.rb'].each { |file| require file }

module Nabortu
  class Client
    def initialize

    end

    def method_missing(name, params, args = {})
      klass = ['Nabortu', 'Methods', name.to_s.camelize].join('::')
      if Object.const_defined? klass
        begin
          res = soap_client.call(name, message: klass.constantize.request(params))
          puts res.inspect
        rescue => e
          puts e.inspect
        end
      else
        raise Nabortu::Errors::WrongMethod.new("Nabortu API does not have '#{name}' method or it\'s not implemented")
      end
    end

    def soap_client
      params = {
          'wsdl'                 => Nabortu.config.url,
          'open_timeout'         => 3000,
          'read_timeout'         => 3000,
          'element_form_default' => 'unqualified',
          'soap_header' => {
            'AuthentificationHeader' => {
              'Login'     => Nabortu.config.login,
              'Password'  => Nabortu.config.password,
              'PartnerId' => Nabortu.config.partner_id
            },
            'attributes!' => { 'AuthentificationHeader' => { 'xmlns' => 'http://www.nabortu.ru/'} }
          }
      }

      Savon::Client.new(params) { convert_request_keys_to :camelcase }
    end
  end
end