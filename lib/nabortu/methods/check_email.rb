module Nabortu
  module Methods
    class CheckEmail
      class << self
        def request(params = {})
          email = params[:email] || raise(Nabortu::Errors::NoParam.new :email)
          {'tns:email' => email}
        end
      end
    end
  end
end