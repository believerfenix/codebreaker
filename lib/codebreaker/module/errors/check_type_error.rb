# frozen_string_literal: true

module Codebreaker
  module Errors
    class CheckTypeError < StandardError
      STANDARD_MESSAGE = 'Invalid type'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
