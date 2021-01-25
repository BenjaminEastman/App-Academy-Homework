class PolyTreeNode

    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(name)
        if !@parent.nil?
            @parent.children.delete(self)

        end
        
        @parent = name
        if !@parent.nil?
            name.children << self
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent=(nil)
        else 
            raise "Node is not a child"
        end
    end

    def dfs(target_value)
        if @value == target_value
            return self
        else
            self.children.each do |child| 
                result = child.dfs(target_value)
                return result if !result.nil?
            end
        end
        nil
    end

    def bfs(target_value)
        queue = [self]

        while queue.length > 0
            element = queue.shift
            if element.value == target_value
                return element
            else
                queue << element.children
                queue.flatten
            end
        end
        nil
    end

end