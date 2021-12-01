# frozen_string_literal: true

module Codebreaker
  class Difficulty
    include Validation

    DIFFICULTIES = {
      easy: { attempts: 15, hints: 2 },
      medium: { attempts: 10, hints: 1 },
      hell: { attempts: 5, hints: 1 }
    }.freeze

    attr_reader :user_difficulty, :attempts, :hints

    def initialize(user_difficulty)
      check_difficulty(user_difficulty)
      @user_difficulty = user_difficulty
      @attempts = DIFFICULTIES[@user_difficulty][:attempts]
      @hints = DIFFICULTIES[@user_difficulty][:hints]
    end

    def <=>(other)
      [attempts, hints] <=> [other.attempts, other.hints]
    end
  end
end
