# frozen_string_literal: true

require_relative '../spec_helper'

require_relative '../../lib/r0man/digit'
require_relative '../../lib/r0man/maximum_consecutive_count'
require_relative '../../lib/r0man/number'

describe 'Roman number' do
  describe 'when a number has three consecutive I' do
    let(:number) { R0man::Number.parse('III') }

    it 'has no errors' do
      expect(number.errors).must_be_empty
    end
  end

  describe 'when a number has one V' do
    let(:number) { R0man::Number.parse('V') }

    it 'has no errors' do
      expect(number.errors).must_be_empty
    end
  end

  describe 'when in a number has four consecutive I' do
    let(:number) { R0man::Number.parse('IIII') }

    it 'has errors' do
      expect(number.errors).must_equal(['I occurs 4 times whereas it is allowed only 3 times'])
    end
  end

  describe 'when a number has two consecutive V' do
    let(:number) { R0man::Number.parse('VV') }

    it 'has errors' do
      expect(number.errors).must_equal(['V occurs 2 times whereas it is allowed only 1 times'])
    end
  end

  describe 'when I comes before V' do
    let(:number) { R0man::Number.parse('IV') }

    it 'has no errors' do
      expect(number.errors).must_be_empty
    end
  end

  describe 'when I comes before X' do
    let(:number) { R0man::Number.parse('IX') }

    it 'has no errors' do
      expect(number.errors).must_be_empty
    end
  end

  describe 'when L is between X and I' do
    let(:number) { R0man::Number.parse('XLI') }

    it 'has no errors' do
      expect(number.errors).must_be_empty
    end
  end

  describe 'when I comes before L' do
    let(:number) { R0man::Number.parse('IL') }

    it 'has errors' do
      expect(number.errors).must_equal(['I cannot be subtracted from L'])
    end
  end

  describe 'when same digit is added to and subtracted from a bigger digit' do
    let(:number) { R0man::Number.parse('IXI') }

    it 'has errors' do
      expect(number.errors).must_equal(['I cannot be added to and subtracted from the same X'])
    end
  end
end
