# frozen_string_literal: true

module Codebreaker
  RSpec.describe Difficulty do
    subject(:difficulty) { described_class.new(level) }
    let(:level) { :medium }
    let(:easy_difficulty) { described_class.new(:easy) }
    let(:hell_difficulty) { described_class.new(:hell) }
    let(:equal_difficulty) { described_class.new(:medium) }

    it 'check the number of attempts on this difficulty' do
      expect(difficulty.attempts).to eq(Difficulty::DIFFICULTIES[level][:attempts])
    end

    it 'check the number of hints on this difficulty' do
      expect(difficulty.hints).to eq(Difficulty::DIFFICULTIES[level][:hints])
    end

    context '#<=>' do
      it 'is harder when fewer attempts and hints' do
        expect(difficulty <=> easy_difficulty).to eq(-1)
      end

      it 'is easier when more attempts and hints' do
        expect(difficulty <=> hell_difficulty).to eq 1
      end

      it 'is equal another difficulty when has same amount of attempts and hints' do
        expect(difficulty <=> equal_difficulty).to eq 0
      end
    end
  end
end
