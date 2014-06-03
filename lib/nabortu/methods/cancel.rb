module Nabortu
  module Methods
    class Cancel < Base
      def request(params = {})
        reserve_id = params[:reserve_id] || raise(Nabortu::Errors::NoParam.new :reserve_id)
        {'tns:id_Reserve' => reserve_id}
      end
    end
  end
end
