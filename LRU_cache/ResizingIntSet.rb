class ResizingIntSet

    def initialize(array=[])
        @store = Array.new(20) { [] }
        @num_of_elements = 0
        array.each { |el| insert(el) }
    end

    def insert(el)
        
        unless include?(el)
            self[el] << el 
            @num_of_elements += 1
        end
        
        @store = resize if @store.size == @num_of_elements
    end

    def remove(el)
        if include?(el)
            self[el].delete(el) 
            @num_of_elements -= 1
        end
        nil
    end

    def include?(el)
        self[el].include?(el)
    end

    private 

    def [](el)
        @store[el % @store.size]
    end

    def inspect
        { num_of_buckets: @store.size, num_of_elements: @store.flatten.size }
    end

    def resize
        #initialize new size
        new_size = @store.size * 2
        new_store = Array.new(new_size) {[]}
        #use flatten and iterate through each calling insert
        @store.flatten.each do |el|
            new_store[el % new_size] << el
        end
        new_store
    end
end

set = ResizingIntSet.new([1, 5, 2, 4, -1, 5] + (1..1000).to_a)

p set.include?(5)
p set.include?(10)
set.insert(25)
p set
set.remove(1)
p set.include?(1)
p set.include?(25)