# frozen_string_literal: true

module Codebreaker
  module Errors
    class CheckCodeLengthError < StandardError
      STANDARD_MESSAGE = 'The entered code must be in the format: 4 digits'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
