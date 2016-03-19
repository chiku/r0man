require_relative "../spec_helper"

require_relative "../../lib/roman/digit"
require_relative "../../lib/roman/number"
require_relative "../../lib/roman/maximum_consecutive_count"

describe "Roman number" do
  describe "when a number has three consecutive I" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::I, Roman::Digit::I) }

    it "has no errors" do
      number.errors.must_be_empty
    end
  end

  describe "when a number has one V" do
    let(:number) { Roman::Number.new(Roman::Digit::V) }

    it "has no errors" do
      number.errors.must_be_empty
    end
  end

  describe "when in a number has four consecutive I" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::I, Roman::Digit::I, Roman::Digit::I) }

    it "has errors" do
      number.errors.must_equal ["I(1) occurs 4 times whereas it is allowed only 3 times"]
    end
  end

  describe "when a number has two consecutive V" do
    let(:number) { Roman::Number.new(Roman::Digit::V, Roman::Digit::V) }

    it "has errors" do
      number.errors.must_equal ["V(5) occurs 2 times whereas it is allowed only 1 times"]
    end
  end

  describe "when I comes before V" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::V) }

    it "has no errors" do
      number.errors.must_be_empty
    end
  end

  describe "when I comes before X" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::X) }

    it "has no errors" do
      number.errors.must_be_empty
    end
  end

  describe "when L is between X and I" do
    let(:number) { Roman::Number.new(Roman::Digit::X, Roman::Digit::L, Roman::Digit::I) }

    it "has no errors" do
      number.errors.must_be_empty
    end
  end

  describe "when I comes before L" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::L) }

    it "has errors" do
      number.errors.must_equal ["I(1) cannot be subtracted from L(50)"]
    end
  end

  describe "when same digit is added to and subtracted from a bigger digit" do
    let(:number) { Roman::Number.new(Roman::Digit::I, Roman::Digit::X, Roman::Digit::I) }

    it "has errors" do
      number.errors.must_equal ["I(1) cannot be added to and subtracted from X(10)"]
    end
  end
end
