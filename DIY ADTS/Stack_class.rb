class Stack
    def initialize
      @s = []
    end

    def push(el)
      @s << el
    end

    def pop
      @s.delete_at(-1)
    end

    def peek
      @s[-1]
    end
end