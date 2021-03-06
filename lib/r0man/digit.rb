# frozen_string_literal: true

module R0man
  # Digit understands a single item of a Roman number
  class Digit
    attr_reader :value, :name, :max_consecutive_allowed, :allowed_next_digits

    def initialize(options)
      @value                   = options[:value]
      @name                    = options[:name]
      @max_consecutive_allowed = options[:max_consecutive_allowed]
      @allowed_next_digits     = options[:allowed_next_digits]
    end

    M = new(name: 'M', value: 1000, max_consecutive_allowed: 3, allowed_next_digits: [])
    D = new(name: 'D', value: 500, max_consecutive_allowed: 1, allowed_next_digits: [])
    C = new(name: 'C', value: 100, max_consecutive_allowed: 3, allowed_next_digits: [M, D])
    L = new(name: 'L', value: 50, max_consecutive_allowed: 1, allowed_next_digits: [])
    X = new(name: 'X', value: 10, max_consecutive_allowed: 3, allowed_next_digits: [C, L])
    V = new(name: 'V', value: 5, max_consecutive_allowed: 1, allowed_next_digits: [])
    I = new(name: 'I', value: 1, max_consecutive_allowed: 3, allowed_next_digits: [X, V])

    LOOKUP = { I: I, V: V, X: X, L: L, C: C, D: D, M: M }.freeze

    def valid?
      true
    end

    def to_s
      name
    end

    def inspect
      "#{name}(#{value})"
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

    Invalid =
      Struct.new(:name) do
        def valid?
          false
        end
      end

    class << self
      protected :new
    end

    def self.parse(letter)
      LOOKUP[letter.upcase.to_sym] || Invalid.new(letter)
    end
  end
end
