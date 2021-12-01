# frozen_string_literal: true

module Codebreaker
  class CheckUserCode
    def initialize(secret_code, guess_code)
      @code_for_check = secret_code.chars
      @guess_code = guess_code.chars
      @user_result = ''
    end

    def call
      strong_match
      soft_match
      @user_result
    end

    private

    def strong_match
      @code_for_check.each_index do |index|
        next unless @code_for_check[index] == @guess_code[index]

        @user_result += Codebreaker::Constant::STRONG_MATCH
      end
    end

    def soft_match
      @code_for_check, @guess_code = remove_double
      return [] if @code_for_check.nil?

      @guess_code.each do |number|
        next unless @code_for_check.include?(number)

        @code_for_check.delete_at(@code_for_check.index(number))
        @user_result += Codebreaker::Constant::SOFT_MATCH
      end
    end

    def remove_double
      @code_for_check.zip(@guess_code)
                     .reject { |secret_digit, guess_digit| secret_digit == guess_digit }
                     .transpose
    end
  end
end
