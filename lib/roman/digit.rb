module Roman
  class Digit
    attr_reader :value, :name, :max_consecutive_allowed, :allowed_next_digits

    class << self
      protected :new

      def unidentified(name)
        new(name: name, value: 0, max_consecutive_allowed: 0, allowed_next_digits: [])
      end

      def i
        @i ||= new(name: "I", value: 1, max_consecutive_allowed: 3, allowed_next_digits: [v, x])
      end

      def v
        @v ||= new(name: "V", value: 5, max_consecutive_allowed: 1, allowed_next_digits: [])
      end
  
      def x 
        @x ||= new(name: "X", value: 10, max_consecutive_allowed: 3, allowed_next_digits: [l, c])
      end

      def l
        @l ||= new(name: "L", value: 50, max_consecutive_allowed: 1, allowed_next_digits: [])
      end

      def c
        @c ||= new(name: "C", value: 100, max_consecutive_allowed: 3, allowed_next_digits: [d, m])
      end
      
      def d
        @d ||= new(name: "D", value: 500, max_consecutive_allowed: 1, allowed_next_digits: [])
      end

      def m
        @m ||= new(name: "M", value: 1000, max_consecutive_allowed: 3, allowed_next_digits: [])
      end

      def lookup
         @lookup ||= {
          "i" => i,
          "v" => v,
          "x" => x,
          "l" => l,
          "c" => c,
          "d" => d,
          "m" => m,
        }
      end

      def parse(letter)
        lookup[letter.downcase] || unidentified(letter)
      end
    end

    def initialize(options)
      @value                   = options[:value]
      @name                    = options[:name]
      @max_consecutive_allowed = options[:max_consecutive_allowed]
      @allowed_next_digits     = options[:allowed_next_digits]
    end

    def to_s
      "#{name}(#{value})"
    end

    def inspect
      to_s
    end

    def greater_than?(other_digit)
      value > other_digit.value
    end

    def value_compared_to(other_digit)
      other_digit.greater_than?(self) ? -value : value
    end

    def allows_next_digit?(other_digit)
      allowed_next_digits.include?(other_digit)
    end
  end
end
