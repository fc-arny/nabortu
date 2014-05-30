module Nabortu
  module Methods
    class GetVariants
      class << self
        def request(params = {})
          date_to     = params[:date_to]     || raise(Nabortu::Errors::NoParam.new :date_to)
          date_from   = params[:date_from]   || raise(Nabortu::Errors::NoParam.new :date_from)

          origin      = params[:origin]      || 'MOW'
          destination = params[:destination] || raise(Nabortu::Errors::NoParam.new :destination)

          { 'tns:requestParameters' => {
                'AviaSearchRequest' => {
                    'Adults'    => params[:adults]   || 1,
                    'Children'  => params[:children] || 0,
                    'Infants'   => params[:infants]  || 0,
                    'Segments'  => {
                        'ModifiedSegment' => [
                            { 'OriginCode'      => params[:origin] || 'MOW',
                              'DestinationCode' => destination,
                              'Date'            => date_to,
                              'Fare'            => 'Economy'
                            },
                            { 'OriginCode'      => destination,
                              'DestinationCode' => origin,
                              'Date'            => date_from,
                              'Fare'            => 'Economy'
                            }]
                    },
                    'PartnerId'       => Nabortu.config.partner_id,
                    'Fare'            => 'Economy',
                    'FlexibleDates'   => params[:flexible_dates]  || 'false',
                    'OnlyDirect'      => params[:only_direct]     || 'true',
                    'IsOnePassSearch' => params[:one_pass_search] || 'true',
                    'AllowLowcost'    => params[:allow_lowcost]   || 'false',
                    'Nabortu'         => params[:nabortu]         || 'true'
                }
            }
          }  
        end
      end
    end
  end
end