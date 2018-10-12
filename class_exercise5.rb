#As an engineer, I must create a method that receives any number and returns the Factorial of that number.

class FactorialNumber

  def initialize(num)
    @num = num
  end 

  def factorial 
    @num.zero? ? "1" : @num.downto(1).inject(:*)
  end
  
end 

#----------------Test------------------

require 'minitest/autorun'

class FactorialNumberTest < Minitest::Test

  def setup
    @number = FactorialNumber.new(5)
  end

  def test_instance_of_factorial_number
    assert_instance_of(FactorialNumber, @number)
  end

  def test_factorial
    assert_equal(120, @number.factorial)
  end

end

#----------------Test------------------

describe FactorialNumber do

  before do
    @num = FactorialNumber.new(3)
  end

  describe "when insert a number" do
    it "must gets the factorial value of a number" do
      @num.factorial.must_equal 6
    end
  end

end
