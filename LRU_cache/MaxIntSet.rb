
class MaxIntSet

    def initialize(max)
        @store = Array.new(max) {false}
    end

    def insert(el)
        raiseError(el)
        @store[el] = true
    end

    def remove(el)
        raiseError(el)
        @store[el] = false
    end

    def include?(el) 
        raiseError(el)
        @store[el]
    end

    def raiseError(el)
        raise "Number out of bounds" unless el.between?(0, @store.length - 1)
    end
end

set = MaxIntSet.new(4)

[0,2,3].each {|n| set.insert(n)}


p set.include?(0)
p set.include?(1)
set.remove(0)
p set.include?(0)
p set.include?(5)
