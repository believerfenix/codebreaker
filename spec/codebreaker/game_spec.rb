# frozen_string_literal: true

module Codebreaker
  RSpec.describe Game do
    subject(:game) { described_class.new('aaa') }

    describe 'when game has default value' do
      it 'check default difficulty for game' do
        expect(game.difficulty.user_difficulty).to eq(:easy)
      end

      it 'check default difficulty:attempts' do
        expect(game.users_attempts).to eq(Difficulty::DIFFICULTIES[:easy][:attempts])
      end

      it 'check default difficulty:hints' do
        expect(game.users_hints).to eq(Difficulty::DIFFICULTIES[:easy][:hints])
      end
    end

    describe '#use_hint' do
      it 'will return not nil' do
        expect(game.use_hint).not_to be_nil
      end
    end

    describe '#lose' do
      it 'with default numder attempts' do
        expect(game.lose?).to eq(false)
      end

      context 'when user made' do
        before do
          game.instance_variable_set(:@users_attempts, 2)
          game.use_attempts('1234')
        end

        it 'several attempts' do
          expect(game.lose?).to eq(false)
        end
      end

      context 'when user spend' do
        before do
          game.instance_variable_set(:@users_attempts, 1)
          game.use_attempts('1234')
        end

        it 'all attempts' do
          expect(game.lose?).to eq(true)
        end
      end
    end

    describe '#win' do
      context 'when user enter' do
        before do
          game.instance_variable_set(:@secret_code, '1234')
        end

        it 'valid code' do
          expect(game.win?('1234')).to eq(true)
        end

        it 'invalid code' do
          expect(game.win?('4561')).to eq(false)
        end
      end
    end

    describe '#storage' do
      before do
        store = instance_double(Codebreaker::Storage)
        allow(store).to receive(:data).and_return({ user_statistics: [] })
        allow(store).to receive(:save)
        allow(Codebreaker::Storage).to receive(:new).and_return(store)
      end

      it 'when save user statistic' do
        expect { game.save_statistic }.not_to raise_error
      end

      it 'when returns game statistic' do
        expect(described_class.user_statistic).to be_an Array
      end
    end
  end
end
