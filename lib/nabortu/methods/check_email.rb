module Nabortu
  module Methods
    class CheckEmail < Base
      def request(params = {})
        email = params[:email] || raise(Nabortu::Errors::NoParam.new :email)
        {'tns:email' => email}
      end
    end
  end
end