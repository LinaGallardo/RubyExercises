# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

def prime_factor(num)
  Prime.prime_division(num).flatten.max(1)
end

puts prime_factor(600851475143)
