module Roman
  class Number
    include SimpleValidation

    validate :maximum_consecutive_counts_are_inside_limits
    validate :previous_digit_are_allowed
    validate :same_digit_is_not_added_to_and_subtracted_from_a_larger_digit

    class << self
      def parse(str)
        digits = str.each_char.map { |d| Roman::Digit.parse(d) }
        valid, invalid = digits.partition(&:valid?)

        number = new(*valid)
        unless invalid.empty?
          invalid_letters = invalid.map(&:name).join(", ")
          number.add_error("Number contains invalid characters: #{invalid_letters}")
        end

        number
      end
    end

    def initialize(*digits)
      @digits = digits
    end

    def value
      @digits.each_cons(2).reduce(0) { |result, (d1, d2)| result += d1.value_compared_to(d2) } + @digits.last.value
    end

    private

    def maximum_consecutive_counts_are_inside_limits
      Roman::MaximumConsecutiveCount.for(@digits).each do |digit, count|
        tolerance = digit.max_consecutive_allowed
        add_error("#{digit} occurs #{count} times whereas it is allowed only #{tolerance} times") if count > tolerance
      end
    end

    def previous_digit_are_allowed
      @digits.each_cons(2) do |d1, d2|
        add_error("#{d1} cannot be subtracted from #{d2}") if (!d1.allows_next_digit?(d2) && d2.greater_than?(d1))
      end
    end

    def same_digit_is_not_added_to_and_subtracted_from_a_larger_digit
      @digits.each_cons(3) do |d1, d2, d3|
        add_error("#{d1} cannot be added to and subtracted from #{d2}") if (d1 == d3 && d2.greater_than?(d1))
      end
    end
  end
end
