module Nabortu
  module Methods
    class CalculateVariant
      class << self
        def request(params = {})
          offer   = params[:offer] || raise(Nabortu::Errors::NoParam.new :offer)
          request = params[:request] || raise(Nabortu::Errors::NoParam.new :request)

          {'tns:offer' => {'Item' => camelize(offer)}, 'tns:Request' => request}
        end

        def camelize(hash)
          input, output = hash.dup, hash.dup

          input.each do |key, _|
            if input[key].is_a? String
              if key.to_s.include? '@'
                _key = ['@', key.to_s.gsub('@', '').camelize].join.to_sym
                output.delete(key)
                output[_key] = input[key]
              end
            elsif input[key].is_a?(Hash)
              output[key] = camelize(input[key])
            elsif input[key].is_a?(Array)
              output[key] = input.delete(key).map{ |item| camelize(item) }
            end
          end

          output
        end
      end
    end
  end
end