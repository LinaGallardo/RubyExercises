# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

class Multiples

  def initialize(num_1, num_2, limit)
    @num_1 = num_1
    @num_2 = num_2
    @limit = limit
  end
  
  def multiples_of
    (1...@limit).select { |num| num % @num_1 == 0 || num % @num_2 == 0 }.inject(:+)
  end

end

#----------------Test------------------

require 'minitest/autorun'

 class MultiplesTest < Minitest::Test

   def setup
     @number = Multiples.new(3, 5, 1000)
   end

   def test_instance_of_multiples
     assert_instance_of(Multiples, @number)
   end

   def test_multiples_of
     assert_equal(233168, @number.multiples_of)
   end

end

#---------------TestSpecs---------------

describe Multiples do

  before do 
    @number = Multiples.new(3, 5, 1000)
  end

  describe "when insert two numbers and a limit" do
    it "must gets result of the sum of all the multiples of two number" do
      @number.multiples_of.must_equal 233168
    end
  end

end
