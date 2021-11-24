# frozen_string_literal: true

module Codebreaker
  RSpec.shared_examples 'validation' do
    it 'receives error when invalid difficulty name' do
      expect { game.check_difficulty(:aesy) }.to raise_error(Errors::CheckDifficultyError)
    end

    it 'receives error when name has short leght' do
      expect { game.check_name_length('qw') }.to raise_error(Errors::CheckNameLengthError)
    end

    it 'receives error when name  has invalid type' do
      expect { game.check_type(123, String) }.to raise_error(Errors::CheckTypeError)
    end

    it 'receives error when name has long leght' do
      expect { game.check_name_length('qwertyuiopasdfghjklzxcv') }.to raise_error(Errors::CheckNameLengthError)
    end

    it 'receives error when code length is differen 4' do
      expect { game.check_code_length('12345') }.to raise_error(Errors::CheckCodeLengthError)
    end

    it 'receives error when some number of code does not equal 1-6' do
      expect { game.check_code_value('8988') }.to raise_error(Errors::CheckCodeValueError)
    end
  end
end
