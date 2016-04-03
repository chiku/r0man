module R0man
  # MaximumConsecutiveCount understands the longest consecutive occurance of the given item in an array
  class MaximumConsecutiveCount
    class << self
      def for(array)
        counts = Hash.new(0)
        current_count = 1

        (array + [BasicObject.new]).each_cons(2) do |item, next_item|
          current_count = item == next_item ? current_count + 1 : 1
          counts[item] = current_count if current_count > counts[item]
        end

        counts
      end
    end
  end
end
