# frozen_string_literal: true

module Codebreaker
  RSpec.describe CheckUserCode do
    subject(:checker) { described_class.new(secret_code, guess_code) }

    describe 'when I check input and assumed values' do
      test_data = [
        ['6543', '5643', '++--'],
        ['6543', '6411', '+-'],
        ['6543', '6544', '+++'],
        ['6543', '3456', '----'],
        ['6543', '6666', '+'],
        ['6543', '2666', '-'],
        ['6543', '2222', ''],
        ['6666', '1661', '++'],
        ['1234', '3124', '+---'],
        ['1234', '1524', '++-'],
        ['1234', '1234', '++++']
      ]

      test_data.each do |data|
        context "#{data[2]} -> guess_code: #{data[1]}, secret_code: #{data[0]}" do
          let(:secret_code) { data[0] }
          let(:guess_code) { data[1] }

          it 'receives correct result' do
            expect(checker.check_usercode).to eq(data[2])
          end
        end
      end
    end
  end
end
