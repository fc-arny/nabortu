module Nabortu
  module Methods
    class TryAuth < Base
      def request(params = {})
        email    = params[:email] || raise(Nabortu::Errors::NoParam.new :email)
        password = params[:password] || raise(Nabortu::Errors::NoParam.new :password)

        { 'tns:Login' => email, 'tns:Password' => password }
      end
    end
  end
end