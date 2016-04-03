require_relative "../spec_helper"

require_relative "../../lib/r0man/maximum_consecutive_count"

describe "Maximum consecutive count" do
  describe "for an empty array" do
    it "is nothing" do
      R0man::MaximumConsecutiveCount.for([]).must_equal({})
    end
  end

  describe "for a single non-repeated element" do
    it "is one" do
      R0man::MaximumConsecutiveCount.for([10]).must_equal({10 => 1})
    end
  end

  describe "for a single repeated element" do
    it "is the number of repeations" do
      R0man::MaximumConsecutiveCount.for([10, 10, 10]).must_equal({10 => 3})
    end
  end

  describe "for an array with kinds of items" do
    it "is the number of repeations for each item" do
      R0man::MaximumConsecutiveCount.for([10, 10, 5]).must_equal({10 => 2, 5 => 1})
    end
  end

  describe "for an array with one type followed by another type followed by first type" do
    it "is the count of maximum number of elements in a single stretch" do
      R0man::MaximumConsecutiveCount.for([10, 5, 10, 10]).must_equal({10 => 2, 5 => 1})
    end
  end
end
