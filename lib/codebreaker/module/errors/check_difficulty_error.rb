# frozen_string_literal: true

module Codebreaker
  module Errors
    class CheckDifficultyError < StandardError
      STANDARD_MESSAGE = 'Difficulty must be: easy, medium, hell'

      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
