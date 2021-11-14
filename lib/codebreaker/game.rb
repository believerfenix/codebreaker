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
      @users_attempts -= 1
      CheckUserCode.new(@secret_code.to_s, guess_code).check_usercode
      binding.pry
    end
  end
end
