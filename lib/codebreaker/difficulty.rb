# frozen_string_literal: true

module Codebreaker
  class Difficulty
    DIFFICULTIES = {
      easy: { name: 'easy', attempts: 15, hints: 2 },
      medium: { name: 'medium', attempts: 10, hints: 1 },
      hell: { name: 'hell', attempts: 5, hints: 1 }
    }.freeze

    def <=>(other)
      [attempts, hints] <=> [other.attempts, other.hints]
    end

    attr_reader :user_difficulty, :attempts, :hints

    def initialize(user_difficulty)
      @user_difficulty = user_difficulty
      @attempts = DIFFICULTIES[@user_difficulty][:attempts]
      @hints = DIFFICULTIES[@user_difficulty][:hints]
    end
  end
end
