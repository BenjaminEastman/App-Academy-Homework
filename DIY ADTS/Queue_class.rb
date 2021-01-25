class Queue
    def initialize
      @q = []
    end

    def enqueue(el)
      @q.unshift(el)
    end

    def dequeue
      @q.delete_at(-1)
    end

    def peek
      @q[-1]
    end
end