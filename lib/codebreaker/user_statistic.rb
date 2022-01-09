# frozen_string_literal: true

module Codebreaker
  class UserStatistic
    attr_reader :user, :difficulty, :attempts, :hints, :date

    def initialize(user:, difficulty:, attempts:, hints:)
      @user = user
      @difficulty = difficulty
      @attempts = attempts
      @hints = hints
      @date = DateTime.now
    end
  end
end
