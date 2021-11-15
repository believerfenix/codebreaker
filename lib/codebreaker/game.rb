# frozen_string_literal: true

module Codebreaker
  class Game
    def initialize(user, difficulty = 'easy')
      @user = user
      @secret_code = SecretCode.new.generate_secret_code
      @difficulty = Difficulty.new difficulty.to_sym
      @users_attempts = @difficulty.attempts
      @users_hints = @difficulty.hints
      @date = DateTime.now
    end

    def use_attempts(guess_code)
      return if lose?

      @users_attempts -= 1
      CheckUserCode.new(@secret_code.to_s, guess_code).check_usercode
    end

    def use_hint
      @code_for_hint ||= @secret_code.to_s.chars.sample(@difficulty.hints)
      @users_hints -= 1
      @code_for_hint.pop
    end

    def win?(guess_code)
      @secret_code.to_s == guess_code
    end

    def lose?
      @users_attempts.zero?
    end
  end
end
