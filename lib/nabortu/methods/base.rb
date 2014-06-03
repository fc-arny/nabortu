module Nabortu
  module Methods
    class Base

      attr_accessor :params, :response

      def self.do_request(method_name, params = {})
        new(method_name, params).do_request
      end

      def initialize(method_name, params = {})
        @method_name, @params, @response = method_name, params, nil
      end

      def do_request
        prepare_result soap_client.call(@method_name, message: request(@params))
      rescue Savon::SOAPFault => error
        fail_callback(error)
      end

      protected

      def soap_client
        params = {
            wsdl:                 Nabortu.config.url,
            open_timeout:         3000,
            read_timeout:         3000,
            element_form_default: 'unqualified',
            soap_header: {
                'AuthentificationHeader' => {
                    'Login'     => Nabortu.config.login,
                    'Password'  => Nabortu.config.password,
                    'PartnerId' => Nabortu.config.partner_id
                },
                attributes!: { 'AuthentificationHeader' => { 'xmlns' => 'http://www.nabortu.ru/'} }
            },
            logger: Rails.logger
        }

        Savon.client(params) { convert_request_keys_to :camelcase }
      end

      def request(params = {})
        raise StandardError.new("You try execute abstract method 'request' of Nabortu::Methods::Base")
      end

      def fail_callback(error)
        raise error
      end

      def prepare_result(response)
        @response = response
      end
    end
  end
end