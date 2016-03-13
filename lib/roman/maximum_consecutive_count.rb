module Roman
  class MaximumConsecutiveCount
    class << self
      def for(array)
        MaximumConsecutiveCount.new.for(array)
      end
    end

    def for(array)
      counts = Hash.new(0)
      current_count = 1

      (array + [Float::NAN]).each_cons(2) do |item, next_item|
        if item == next_item
          current_count += 1
        else
          current_count = 1
        end
        counts[item] = current_count if current_count > counts[item]
      end

      counts
    end
  end
end
