# frozen_string_literal: true

RSpec.shared_examples 'validation' do
  context 'when invalid difficulty name' do
    it { expect { game.check_difficulty(:aesy) }.to raise_error(Codebreaker::Errors::CheckDifficultyError) }
  end

  context 'when name has short length' do
    it { expect { game.check_name_length('qw') }.to raise_error(Codebreaker::Errors::CheckNameLengthError) }
  end

  context 'when name has invalid type' do
    it { expect { game.check_type(123, String) }.to raise_error(Codebreaker::Errors::CheckTypeError) }
  end

  context 'when name has long length' do
    it {
      expect do
        game.check_name_length('qwertyuiopasdfghjklzxcv')
      end.to raise_error(Codebreaker::Errors::CheckNameLengthError)
    }
  end

  context 'when code length is different 4' do
    it { expect { game.check_code_length('12345') }.to raise_error(Codebreaker::Errors::CheckCodeLengthError) }
  end

  context 'when some number of code does not equal 1-6' do
    it { expect { game.check_code_value('8988') }.to raise_error(Codebreaker::Errors::CheckCodeValueError) }
  end
end
