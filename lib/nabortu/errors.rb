module Nabortu
  module Errors

    # Raised when required param does not pass
    class NoParam < StandardError
      def initialize(name, message = '')
        msg = message.empty? ? "You must set param '#{name}' for request" : message
        super(msg)
      end
    end

    # Raised when you try call non-existed API method
    class WrongMethod < StandardError
    end
  end
end