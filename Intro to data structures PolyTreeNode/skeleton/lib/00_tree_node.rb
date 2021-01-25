class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(name)
        if !@parent.nil?
            @parent.children.delete(self)

        end
        
        @parent = name
        name.children << self
    end


end