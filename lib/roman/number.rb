module Roman
  class Number
    include SimpleValidation

    validate :maximum_consecutive_counts_are_inside_limits
    validate :previous_digit_are_allowed
    validate :same_digit_is_not_added_to_and_subtracted_from_a_larger_digit

    def self.parse(str)
      digits = str.each_char.map { |d| Roman::Digit.parse(d) }
      valid, invalid = digits.partition { |digit| digit.value > 0 } 
      number = new(*valid)
      if invalid.count > 0
         invalid_letters = invalid.map(&:name).join(", ")
        number.add_error("Number contains invalid characters: #{invalid_letters}")
      end
      number
    end

    def initialize(*digits)
      @digits = digits
    end

    def value
      digits = @digits + [Roman::Digit.zero]

      digits.each_cons(2).reduce(0) do |result, (digit_one, digit_two)|
        result += digit_one.value_compared_to(digit_two)
      end
    end

    private

    def maximum_consecutive_counts_are_inside_limits
      Roman::MaximumConsecutiveCount.for(@digits).each do |digit, count|
        tolerance = digit.max_consecutive_allowed
        add_error("#{digit} occurs #{count} times whereas it is allowed only #{tolerance} times") if count > tolerance
      end
    end

    def previous_digit_are_allowed
      @digits.each_cons(2) do |digit_one, digit_two|
        add_error("#{digit_one} cannot be subtracted from #{digit_two}") if (!digit_one.allows_next_digit?(digit_two) && digit_two.greater_than?(digit_one))
      end
    end

    def same_digit_is_not_added_to_and_subtracted_from_a_larger_digit
      @digits.each_cons(3) do |digit_one, digit_two, digit_three|
        add_error("#{digit_one} cannot be added to and subtracted from #{digit_two}") if (digit_one == digit_three && digit_two.greater_than?(digit_one))
      end
    end
  end
end
