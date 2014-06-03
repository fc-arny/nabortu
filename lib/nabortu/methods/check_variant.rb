module Nabortu
  module Methods
    class CheckVariant < Base
      def request(params = {})
        offer   = params[:offer] || raise(Nabortu::Errors::NoParam.new :offer)
        request = params[:request] || raise(Nabortu::Errors::NoParam.new :request)

        {'tns:offer' => {'Item' => offer.camelize_keys}, 'tns:Request' => request}
      end
    end
  end
end