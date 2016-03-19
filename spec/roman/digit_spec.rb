require_relative "../spec_helper"

require_relative "../../lib/roman/digit"

describe "Roman digit" do
  it "has a value" do
    Roman::Digit.x.value.must_equal 10
  end

  it "has a name" do
    Roman::Digit.x.name.must_equal 'X'
  end

  it "equals itself" do
    Roman::Digit.x.must_equal Roman::Digit.x
  end

  describe "when compared to a smaller digit" do
    it "has a positive value" do
      Roman::Digit.x.value_compared_to(Roman::Digit.v).must_equal 10
    end

    it "knows that it is greater than the smaller digit" do
      Roman::Digit.x.greater_than?(Roman::Digit.v).must_equal true
    end
  end

  describe "when compared to itself" do
    it "has a positive value" do
      Roman::Digit.x.value_compared_to(Roman::Digit.x).must_equal 10
    end

    it "knows that it doesn't exceed itself" do
      Roman::Digit.x.greater_than?(Roman::Digit.x).must_equal false
    end
  end

  describe "when compared to a larger digit" do
    it "has a positive value" do
      Roman::Digit.x.value_compared_to(Roman::Digit.l).must_equal -10
    end

    it "knows that it not greater than the larger digit" do
      Roman::Digit.x.greater_than?(Roman::Digit.l).must_equal false
    end
  end

  describe ".parse" do
    describe "for a known lower-case letter" do
      it "converts it to the corresponding digit" do
        Roman::Digit.parse("i").must_equal Roman::Digit.i
      end
    end

    describe "for a known upper-case letter" do
      it "converts it to the corresponding digit" do
        Roman::Digit.parse("X").must_equal Roman::Digit.x
      end
    end

    describe "for an unknown letter" do
      it "converts it is unidentified" do
        Roman::Digit.parse("g").name.must_equal Roman::Digit.unidentified("g").name
      end
    end
  end
end
