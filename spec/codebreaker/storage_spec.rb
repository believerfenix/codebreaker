# frozen_string_literal: true

module Codebreaker
  RSpec.describe Storage do
    subject(:store) { described_class.new }

    let(:directory_path) { 'Codebreaker::Constant::STORAGE_DIRECTORY_CONSTANT' }
    let(:filename) { 'Codebreaker::Constant::STORAGE_FILE_CONSTANT' }

    describe 'instance creation' do
      context 'when db initialized' do
        let(:fixtures_directory_path) { 'spec/codebreaker/fixtures' }
        let(:fixtures_filename) { 'user_statistics.yml' }

        before do
          stub_const(directory_path, fixtures_directory_path)
          stub_const(filename, fixtures_filename)
        end

        it 'can load users statistics' do
          expect(store.data[:user_statistics]).not_to be_empty
        end
      end

      context 'when db is not initialized' do
        let(:initialized_directory_path) { 'test_db' }
        let(:initialized_filename) { 'user_statistics.yml' }

        before do
          stub_const(directory_path, initialized_directory_path)
          stub_const(filename, initialized_filename)
        end

        after do
          File.delete(File.join(initialized_directory_path, initialized_filename))
          Dir.rmdir(initialized_directory_path)
        end

        it 'initialize db and return default data' do
          expect(store.data[:user_statistics]).to be_empty
        end
      end
    end

    describe '#save' do
      let(:user) { Codebreaker::Game.new('Arthur') }

      before do
        stub_const(directory_path, 'test_db')
        stub_const(filename, 'saved_user_statistics.yml')
        statistics = Codebreaker::UserStatistic.new(user: user, difficulty: Codebreaker::Difficulty.new(:medium),
                                                    attempts: 5, hints: 1)
        store.data[:user_statistics] << statistics
      end

      after do
        File.delete(File.join('test_db', 'saved_user_statistics.yml'))
        Dir.rmdir('test_db')
      end

      it 'can save users statistics' do
        expect { store.save }.not_to raise_error
      end
    end
  end
end
