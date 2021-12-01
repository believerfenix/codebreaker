# frozen_string_literal: true

RSpec.describe Codebreaker::SecretCode do
  subject(:code) { described_class.new }

  let(:secret_code) { code.generate_secret_code }

  it 'receives secret code not nil' do
    expect(secret_code).not_to be_nil
  end

  it 'receives all number secret code greater 1' do
    expect(secret_code.chars.map(&:to_i)).to all(be >= Codebreaker::Constant::MIN_CODE_VALUE)
  end

  it 'receives all number secret code less 7' do
    expect(secret_code.chars.map(&:to_i)).to all(be <= Codebreaker::Constant::MAX_CODE_VALUE)
  end

  it 'receives that secret code has correct length' do
    expect(secret_code.length).to eq(Codebreaker::Constant::CODE_SIZE)
  end
end
