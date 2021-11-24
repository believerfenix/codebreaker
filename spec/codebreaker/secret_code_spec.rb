# frozen_string_literal: true

module Codebreaker
  RSpec.describe SecretCode do
    subject(:code) { described_class.new }

    let(:secretcode) { code.generate_secret_code }

    it 'receives secretcode not nil' do
      expect(secretcode).not_to be_nil
    end

    it 'receives all number secretcode greater 1' do
      expect(secretcode.chars.map(&:to_i)).to all(be >= Codebreaker::Constant::MIN_CODE_VALUE)
    end

    it 'receives all number secretcode less 7' do
      expect(secretcode.chars.map(&:to_i)).to all(be <= Codebreaker::Constant::MAX_CODE_VALUE)
    end

    it 'receives that secretcode has correct length' do
      expect(secretcode.length).to eq(Codebreaker::Constant::CODE_SIZE)
    end
  end
end
