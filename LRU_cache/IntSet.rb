class IntSet

    def initialize(array=[])
        @store = Array.new(20) { [] }
        array.each { |el| insert(el) }
    end

    def insert(el)
        self[el] << el unless include?(el)
        nil
    end

    def remove(el)
        self[el].delete(el) if include?(el)
        nil
    end

    def include?(el)
        self[el].include?(el)
    end

    private 

    def [](el)
        @store[el % 20]
    end
end

# set = IntSet.new([1, 5, 2, 4, -1, 5])

# p set.include?(5)
# p set.include?(10)
# set.insert(25)
# p set
# set.remove(1)
# p set.include?(1)
# p set.include?(25)
