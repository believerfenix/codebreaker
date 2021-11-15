# frozen_string_literal: true

module Codebreaker
  RSpec.describe Validation do
    subject(:validation) { class_with_validation.new }

    let(:class_with_validation) { Class.new { include Codebreaker::Validation } }

    it 'check invalid difficulty name' do
      expect { validation.check_difficulty(:aesy) }.to raise_error(Errors::CheckDifficultyError)
    end

    it 'check name for short leght' do
      expect { validation.check_name_length('qw') }.to raise_error(Errors::CheckNameLengthError)
    end

    it 'check name for type' do
      expect { validation.check_type(123, String) }.to raise_error(Errors::CheckTypeError)
    end

    it 'check name for long leght' do
      expect { validation.check_name_length('qwertyuiopasdfghjklzxcv') }.to raise_error(Errors::CheckNameLengthError)
    end

    it 'check code length must be 4' do
      expect { validation.check_code_length('12345') }.to raise_error(Errors::CheckCodeLengthError)
    end

    it 'check code value must be 1-6' do
      expect { validation.check_code_value('8988') }.to raise_error(Errors::CheckCodeValueError)
    end
  end
end
