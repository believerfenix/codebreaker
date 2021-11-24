# frozen_string_literal: true

module Codebreaker
  RSpec.describe Game do
    subject(:game) { described_class.new('aaa') }

    include_examples 'validation'

    describe 'when game has default value' do
      it 'receives default difficulty for game' do
        expect(game.difficulty.user_difficulty).to eq(:easy)
      end

      it 'receives default difficulty`s attempts' do
        expect(game.users_attempts).to eq(Difficulty::DIFFICULTIES[:easy][:attempts])
      end

      it 'receives default difficulty`s hints' do
        expect(game.users_hints).to eq(Difficulty::DIFFICULTIES[:easy][:hints])
      end
    end

    describe '#use_hint' do
      it 'receives some value which not nil' do
        expect(game.use_hint).not_to be_nil
      end
    end

    describe '#lose' do
      it 'receives false when check #lose? with default numder attempts' do
        expect(game.lose?).to eq(false)
      end

      context 'when user made several attempts' do
        before do
          game.instance_variable_set(:@users_attempts, 2)
          game.use_attempts('1234')
        end

        it 'receives false because user still have attempts' do
          expect(game.lose?).to eq(false)
        end
      end

      context 'when the user has tried all attempts' do
        before do
          game.instance_variable_set(:@users_attempts, 1)
          game.use_attempts('1234')
        end

        it 'receives true' do
          expect(game.lose?).to eq(true)
        end
      end
    end

    describe '#win' do
      context 'when user' do
        before do
          game.instance_variable_set(:@secret_code, '1234')
        end

        context 'enter winning code' do
          it 'releives true' do
            expect(game.win?('1234')).to eq(true)
          end
        end

        context 'enter not winning code' do
          it 'receives false' do
            expect(game.win?('4561')).to eq(false)
          end
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

      it 'not receives error when save statistic' do
        expect { game.save_statistic }.not_to raise_error
      end

      it 'receives statistic as an array' do
        expect(described_class.user_statistic).to be_an Array
      end
    end
  end
end
