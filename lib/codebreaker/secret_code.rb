# frozen_string_literal: true

module Codebreaker
  class SecretCode
    def generate_secret_code
      (0...Codebreaker::Constant::CODE_SIZE).collect do
        rand(Codebreaker::Constant::MIN_CODE_VALUE..Codebreaker::Constant::MAX_CODE_VALUE)
      end.join
    end
  end
end
