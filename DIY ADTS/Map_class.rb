class Map
    def initialize
      @map_1 = Array.new
    end

    def set(k, v)
        found = false
        
        @map_1.each_with_index do |ele, i|
            if ele[0] == k
                found = true
                @map_1[i] = [k, v]
                
            end
            
        end

        if found == false
            @map_1 << [k, v]
        end
        @map_1
    end

    def get(key)
        @map_1.each_with_index do |ele, i|
            if ele[0] == key
                puts ele[1]
            end
        end
    end

    def delete(key)
        @map_1.each_with_index do |ele, i|
            if ele[0] == key
                @map_1.delete_at(i)
            end
        end
    end

    def show
        p @map_1
    end

end


