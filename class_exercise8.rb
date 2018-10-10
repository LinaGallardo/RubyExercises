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

number = PrimeNumbers.new(10001)
puts number.primes