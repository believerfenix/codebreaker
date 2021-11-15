# frozen_string_literal: true

module Codebreaker
  RSpec.describe SecretCode do
    subject(:code) { described_class.new }

    let(:secretcode) { code.generate_secret_code }

    it 'check generation secretcode' do
      expect(secretcode).not_to be_nil
    end

    it 'check secretcode: all number greater 1' do
      expect(secretcode.split('').map(&:to_i)).to all(be >= Codebreaker::Constant::MIN_CODE_VALUE)
    end

    it 'check secretcode: all number less 7' do
      expect(secretcode.split('').map(&:to_i)).to all(be <= Codebreaker::Constant::MAX_CODE_VALUE)
    end

    it 'check lenght secretcode' do
      expect(secretcode.length).to eq(Codebreaker::Constant::CODE_SIZE)
    end
  end
end
