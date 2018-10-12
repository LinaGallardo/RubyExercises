# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

class PrimeNumbers

  def initialize(num)
    @num = num
  end

  def prime_factor
    Prime.prime_division(@num).flatten.max
  end

end

#----------------Test------------------

require 'minitest/autorun'

class PrimeTest < Minitest::Test

  def setup
    @primes = PrimeNumbers.new(600851475143)
  end

  def test_instance_of_prime_numbers
    assert_instance_of(PrimeNumbers, @primes)
  end

  def test_prime_factor
    assert_equal(6857, @primes.prime_factor)
  end

end

#----------------TestSpecs------------------

describe PrimeNumbers do

  before do
    @primes = PrimeNumbers.new(123)
  end

  describe "when insert a number" do
    it "must gets the result of largest factor prime" do
      @primes.prime_factor.must_equal 41
    end
  end

end
