# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 
class SquaresNunber
  def initialize(num)
    @num = num
  end
  def squares
    square_sum = (1..@num).sum ** 2
    sum_square = (1..@num).map { |num| num ** 2 }.sum
    difference = (square_sum - sum_square)
  end
end

number = SquaresNunber.new(100)
puts number.squares