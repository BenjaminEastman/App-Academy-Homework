
def fib(n)
    return 0 if n < 1
    return 1 if n == 1
    return 1 if n == 2

    fib(n - 1) + fib(n - 2)

end

p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(5)
p fib(6)
p fib(0)

def fib_tab(n)
    table = Array.new(n + 1, 0)
    table[1] = 1
    
    table.each_index do |i|
        if i > 1
            table[i] = table[i - 1] + table[i - 2]
        end
    end
    p table[0..n]
    "Fib number #{n} is #{table[n]}"

end

p fib_tab(1)
p fib_tab(2)
p fib_tab(3)
p fib_tab(4)
p fib_tab(5)
p fib_tab(6)
p fib_tab(50)
