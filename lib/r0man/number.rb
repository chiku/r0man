# frozen_string_literal: true

require 'simple_validation'

module R0man
  # Number understands convertion of Roman numbers to Indian numbers
  class Number
    include SimpleValidation

    validate :digits_are_valid
    validate :maximum_consecutive_counts_are_inside_limits
    validate :previous_digit_are_allowed
    validate :same_digit_is_not_added_to_and_subtracted_from_a_larger_digit

    def self.parse(str)
      new(str)
    end

    def initialize(str)
      digits = str.each_char.map { |d| Digit.parse(d) }
      @valid, @invalid = digits.partition(&:valid?)
    end

    def value
      @value ||= @valid.each_cons(2).reduce(0) do |result, (d1, d2)|
        result + d1.value_compared_to(d2)
      end + @valid.last.value
    end

    private

    def digits_are_valid
      add_error("Number contains invalid characters: #{@invalid.map(&:name).join(', ')}") unless @invalid.empty?
    end

    def maximum_consecutive_counts_are_inside_limits
      MaximumConsecutiveCount.for(@valid).each do |digit, count|
        tolerance = digit.max_consecutive_allowed
        add_error("#{digit} occurs #{count} times whereas it is allowed only #{tolerance} times") if count > tolerance
      end
    end

    def previous_digit_are_allowed
      @valid.each_cons(2) do |d1, d2|
        add_error("#{d1} cannot be subtracted from #{d2}") if !d1.allows_next_digit?(d2) && d2.greater_than?(d1)
      end
    end

    def same_digit_is_not_added_to_and_subtracted_from_a_larger_digit
      @valid.each_cons(3) do |d1, d2, d3|
        add_error("#{d1} cannot be added to and subtracted from the same #{d2}") if d1 == d3 && d2.greater_than?(d1)
      end
    end
  end
end
