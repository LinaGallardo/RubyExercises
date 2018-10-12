# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 

class SquaresNumber

  def initialize(num)
    @num = num
  end

  def squares
    square_sum = (1..@num).sum ** 2
    sum_square = (1..@num).map { |num| num ** 2 }.sum
    difference = (square_sum - sum_square)
  end

end

#----------------Test------------------

require 'minitest/autorun'

class SquaresNumberTest < Minitest::Test

  def setup
    @number = SquaresNumber.new(100)
  end

  def test_instance_of_squares_number
    assert_instance_of(SquaresNumber, @number)
  end

  def test_squares
    assert_equal(25164150, @number.squares)
  end

end

#----------------TestSpecs------------------

describe SquaresNumber do

  before do
    @num = SquaresNumber.new(10)
  end

  describe "when insert a number" do
    it "must gets the value of the difference of the squares" do
      @num.squares.must_equal 2640
    end
  end

end
