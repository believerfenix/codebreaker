# frozen_string_literal: true

module Codebreaker
  module Errors
    class CheckNameLengthError < StandardError
      STANDARD_MESSAGE = 'Name length must be between 3 and 20'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
