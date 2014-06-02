module Nabortu
  module Methods
    class Register
      class << self
        def request(params = {})
          email    = params[:email] || raise(Nabortu::Errors::NoParam.new :email)
          phone    = params[:phone] || raise(Nabortu::Errors::NoParam.new :phone)
          password = params[:password] || raise(Nabortu::Errors::NoParam.new :password)

          {'tns:Email' => email, 'tns:Password' => password, 'tns:MobilePhone' => phone }
        end

      end
    end
  end
end