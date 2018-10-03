# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def prime_factor(num)
  prime = 2
  until num == 1 do
    (num % prime).zero? ? num = num.div(prime) : prime += 1
  end 
  prime
end

puts prime_factor(600851475143)
