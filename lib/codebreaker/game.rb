# frozen_string_literal: true

module Codebreaker
  class Game
    include Validation
    attr_reader :user, :difficulty, :secret_code, :users_attempts, :users_hints

    def initialize(user, difficulty = 'easy')
      check_user_name(user)
      @user = user
      @secret_code = SecretCode.new.generate_secret_code
      @difficulty = Difficulty.new difficulty.to_sym
      @users_attempts = @difficulty.attempts
      @users_hints = @difficulty.hints
    end

    def use_attempts(guess_code)
      check_guess_code(guess_code)
      return if lose?

      @users_attempts -= 1
      CheckUserCode.new(@secret_code.to_s, guess_code).call
    end

    def use_hint
      @code_for_hint ||= @secret_code.chars.sample(@difficulty.hints)
      @users_hints -= 1
      @code_for_hint.pop
    end

    def win?(guess_code)
      @secret_code.to_s == guess_code
    end

    def lose?
      @users_attempts.zero?
    end

    def user_statistic
      Storage.new.sorted_statistics
    end

    def save_statistic
      Storage.new.add_statistic(current_statistic)
    end

    def current_statistic
      UserStatistic.new(user: user,
                        difficulty: difficulty,
                        attempts: difficulty.attempts - users_attempts,
                        hints: difficulty.hints - users_hints)
    end
  end
end
