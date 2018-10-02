# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def multiples_of(num_1, num_2, limit)
  (1...limit).select { |num| num % num_1 == 0 || num % num_2 == 0 }.inject(:+)
end

p multiples_of(3, 5, 1000)
