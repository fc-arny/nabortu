class Hash
  def camelize_keys
    input, output = self.dup, self.dup

    input.each do |key, _|
      case input[key]
        when String
          if key.to_s.include? '@'
            _key = ['@', key.to_s.gsub('@', '').camelize].join.to_sym
            output.delete(key)
            output[_key] = input[key]
          end
        when Hash
          output[key] = input[key].camelize_keys
        when Array
          output[key] = input.delete(key).map{ |item| item.camelize_keys }
      end
    end

    output
  end
end