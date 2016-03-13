require_relative "../spec_helper"

require_relative "../../lib/roman/digit"
require_relative "../../lib/roman/number"
require_relative "../../lib/roman/maximum_consecutive_count"

describe "Roman number" do
  describe "when all values are same" do
    it "is the sum of the values" do
      Roman::Number.new(Roman::Digit.i, Roman::Digit.i, Roman::Digit.i).value.must_equal 3
    end
  end

  describe "when a smaller digit follows a larger digit" do
    it "is the sum of the values" do
      Roman::Number.new(Roman::Digit.v, Roman::Digit.i).value.must_equal 6
    end
  end

  describe "when a smaller digit preceeds a larger digit" do
    it "the value of the smaller digit is subtracted" do
      Roman::Number.new(Roman::Digit.i, Roman::Digit.v).value.must_equal 4
    end
  end

  describe "when a smaller digit is between larger digits" do
    it "the value of the smaller digit is subtracted from the sum of the larger digits" do
      Roman::Number.new(Roman::Digit.v, Roman::Digit.i, Roman::Digit.v).value.must_equal 9
    end
  end

  describe ".parse" do
    describe "when all letters are known" do
      let(:number) { Roman::Number.parse("IV") }

      it "creates a roman number out of them" do
        number.value.must_equal 4
      end

      it "has no errors" do
        number.errors.must_be_empty
      end
    end

    describe "when some letters are unknown" do
      let(:number) { Roman::Number.parse("ISVG") }

      it "creates a roman number out of the identified letters" do
        number.value.must_equal 4
      end

      it "has errors" do
        number.errors.must_equal ["Number contains invalid characters: S, G"]
      end
    end
  end
end
