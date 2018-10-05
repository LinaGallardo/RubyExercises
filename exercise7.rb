# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def squares(num)
 square_sum = (1..num).sum ** 2
 sum_square = (1..num).map { |num| num ** 2 }.sum
 difference = (square_sum - sum_square)
end

puts squares(100)
