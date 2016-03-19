require_relative "../spec_helper"

require_relative "../../lib/roman/digit"

describe "Roman digit" do
  it "has a value" do
    Roman::Digit::X.value.must_equal 10
  end

  it "has a name" do
    Roman::Digit::X.name.must_equal 'X'
  end

  it "is valid" do
    Roman::Digit::X.must_be :valid?
  end

  it "equals itself" do
    Roman::Digit::X.must_equal Roman::Digit::X
  end

  describe "when compared to a smaller digit" do
    it "has a positive value" do
      Roman::Digit::X.value_compared_to(Roman::Digit::V).must_equal 10
    end

    it "knows that it is greater than the smaller digit" do
      Roman::Digit::X.greater_than?(Roman::Digit::V).must_equal true
    end
  end

  describe "when compared to itself" do
    it "has a positive value" do
      Roman::Digit::X.value_compared_to(Roman::Digit::X).must_equal 10
    end

    it "knows that it doesn't exceed itself" do
      Roman::Digit::X.greater_than?(Roman::Digit::X).must_equal false
    end
  end

  describe "when compared to a larger digit" do
    it "has a positive value" do
      Roman::Digit::X.value_compared_to(Roman::Digit::L).must_equal -10
    end

    it "knows that it not greater than the larger digit" do
      Roman::Digit::X.greater_than?(Roman::Digit::L).must_equal false
    end
  end

  describe ".parse" do
    describe "for a known lower-case letter" do
      it "converts it to the corresponding digit" do
        Roman::Digit.parse("i").must_equal Roman::Digit::I
      end
    end

    describe "for a known upper-case letter" do
      it "converts it to the corresponding digit" do
        Roman::Digit.parse("X").must_equal Roman::Digit::X
      end
    end

    describe "for an unknown letter" do
      let(:invalid) { Roman::Digit.parse("g") }

      it "converts it to an unidentified digit with a name" do
        invalid.name.must_equal "g"
      end

      it "is invalid" do
        invalid.wont_be :valid?
      end
    end
  end
end
