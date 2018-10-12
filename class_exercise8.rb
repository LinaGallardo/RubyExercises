# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

require 'prime'

class PrimeNumbers

  def initialize(number)
    @number = number
  end

  def primes
    Prime.first(@number).last
  end

end

#---------------Test---------------

require 'minitest/autorun'

class PrimeNumbersTest < Minitest::Test

  def setup
    @number = PrimeNumbers.new(10001)
  end

  def test_instance_of_prime_numbers
    assert_instance_of(PrimeNumbers, @number)
  end

  def test_primes
    assert_equal(104743, @number.primes)
  end

end

#---------------TestSpecs---------------

describe PrimeNumbers do

  before do
    @num = PrimeNumbers.new(100)
  end

  describe "when insert a number" do
    it "must gets the prime number in the position given" do
      @num.primes.must_equal 541
    end
  end

end
