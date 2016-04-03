require_relative '../spec_helper'

require_relative '../../lib/r0man/digit'
require_relative '../../lib/r0man/number'
require_relative '../../lib/r0man/maximum_consecutive_count'

describe 'Roman number' do
  describe '.parse' do
    describe 'when all values are same' do
      let(:number) { R0man::Number.parse('III') }

      it 'is the sum of the values' do
        number.value.must_equal 3
      end
    end

    describe 'when a smaller digit follows a larger digit' do
      let(:number) { R0man::Number.parse('VI') }

      it 'is the sum of the values' do
        number.value.must_equal 6
      end
    end

    describe 'when a smaller digit preceeds a larger digit' do
      let(:number) { R0man::Number.parse('IV') }

      it 'the value of the smaller digit is subtracted' do
        number.value.must_equal 4
      end
    end

    describe 'when a smaller digit is between larger digits' do
      let(:number) { R0man::Number.parse('VIV') }

      it 'the value of the smaller digit is subtracted from the sum of the larger digits' do
        number.value.must_equal 9
      end
    end

    describe 'when all letters are known' do
      let(:number) { R0man::Number.parse('IV') }

      it 'creates a roman number out of them' do
        number.value.must_equal 4
      end

      it 'has no errors' do
        number.errors.must_be_empty
      end
    end

    describe 'when some letters are unknown' do
      let(:number) { R0man::Number.parse('ISVG') }

      it 'creates a roman number out of the identified letters' do
        number.value.must_equal 4
      end

      it 'has errors' do
        number.errors.must_equal ['Number contains invalid characters: S, G']
      end
    end
  end
end
