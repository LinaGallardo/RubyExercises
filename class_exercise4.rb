# A palindromic number reads the same both ways. The largest palindrome made from the product of
#two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

class Palindromo

  def initialize(limit)
    @limit = limit
  end

  def palindromic
    numbers = []
    100.upto(@limit).each do |num_1|
      (100..@limit).each do |num_2|
        numbers << (num_1 * num_2)
      end
    end
    numbers.select { |num| num.to_s.eql?(num.to_s.reverse) }.max
  end

end

#----------------Test------------------

require 'minitest/autorun'

class PalindromoTest < Minitest::Test

  def setup
    @number = Palindromo.new(999)
  end

  def test_instance_of_palindromo
    assert_instance_of(Palindromo, @number)
  end

  def test_palindromic
    assert_equal(906609, @number.palindromic)
  end

end

#----------------TestSpecs------------------

describe Palindromo do

  before do
    @num = Palindromo.new(300)
  end

  describe "when insert a number of 3-digit" do
    it "must gets the result of largest palindrome of the product of two number 3-digit" do
      @num.palindromic.must_equal 84348
    end
  end

end
