# frozen_string_literal: true

module Codebreaker
  module Errors
    class CheckCodeValueError < StandardError
      STANDARD_MESSAGE = 'The entered code must be in the format: from 1 to 6'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
