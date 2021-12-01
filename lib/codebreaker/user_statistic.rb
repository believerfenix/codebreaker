# frozen_string_literal: true

module Codebreaker
  class UserStatistic
    attr_reader :user, :difficulty, :attempts, :hints

    def initialize(user:, difficulty:, attempts:, hints:)
      @user = user
      @difficulty = difficulty
      @attempts = attempts
      @hints = hints
    end
  end
end
