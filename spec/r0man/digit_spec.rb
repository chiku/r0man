require_relative '../spec_helper'

require_relative '../../lib/r0man/digit'

describe 'Roman digit' do
  it 'has a value' do
    R0man::Digit::X.value.must_equal 10
  end

  it 'has a name' do
    R0man::Digit::X.name.must_equal 'X'
  end

  it 'is valid' do
    R0man::Digit::X.must_be :valid?
  end

  it 'equals itself' do
    R0man::Digit::X.must_equal R0man::Digit::X
  end

  it 'has a string representation' do
    R0man::Digit::X.to_s.must_equal 'X(10)'
  end

  it 'is inspectable' do
    R0man::Digit::X.inspect.must_equal 'X(10)'
  end

  describe 'when compared to a smaller digit' do
    it 'has a positive value' do
      R0man::Digit::X.value_compared_to(R0man::Digit::V).must_equal 10
    end

    it 'knows that it is greater than the smaller digit' do
      R0man::Digit::X.greater_than?(R0man::Digit::V).must_equal true
    end
  end

  describe 'when compared to itself' do
    it 'has a positive value' do
      R0man::Digit::X.value_compared_to(R0man::Digit::X).must_equal 10
    end

    it "knows that it doesn't exceed itself" do
      R0man::Digit::X.greater_than?(R0man::Digit::X).must_equal false
    end
  end

  describe 'when compared to a larger digit' do
    it 'has a positive value' do
      R0man::Digit::X.value_compared_to(R0man::Digit::L).must_equal(-10)
    end

    it 'knows that it not greater than the larger digit' do
      R0man::Digit::X.greater_than?(R0man::Digit::L).must_equal false
    end
  end

  describe '.parse' do
    describe 'for a known lower-case letter' do
      it 'converts it to the corresponding digit' do
        R0man::Digit.parse('i').must_equal R0man::Digit::I
      end
    end

    describe 'for a known upper-case letter' do
      it 'converts it to the corresponding digit' do
        R0man::Digit.parse('X').must_equal R0man::Digit::X
      end
    end

    describe 'for an unknown letter' do
      let(:invalid) { R0man::Digit.parse('g') }

      it 'converts it to an unidentified digit with a name' do
        invalid.name.must_equal 'g'
      end

      it 'is invalid' do
        invalid.wont_be :valid?
      end
    end
  end
end
