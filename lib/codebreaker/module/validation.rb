# frozen_string_literal: true

module Codebreaker
  module Validation
    def check_user_name(name)
      check_type(name, String)
      check_name_length(name)
    end

    def check_guess_code(code)
      check_code_length(code)
      check_code_value(code)
    end

    def check_type(object, expected_class)
      raise Errors::CheckTypeError unless object.is_a?(expected_class)
    end

    def check_name_length(name)
      raise Errors::CheckNameLengthError unless name.length.between?(Codebreaker::Constant::MIN_NAME_LENGTH,
                                                                     Codebreaker::Constant::MAX_NAME_LENGTH)
    end

    def check_code_length(guess)
      raise Errors::CheckCodeLengthError unless guess.to_s.length == Codebreaker::Constant::CODE_SIZE
    end

    def check_code_value(guess)
      raise Errors::CheckCodeValueError unless guess.to_s.chars.all? do |number|
                                                 number.to_i >= Codebreaker::Constant::MIN_CODE_VALUE &&
                                                 number.to_i <= Codebreaker::Constant::MAX_CODE_VALUE
                                               end
    end

    def check_difficulty(difficulty)
      raise Errors::CheckDifficultyError unless Difficulty::DIFFICULTIES.key?(difficulty)
    end
  end
end
