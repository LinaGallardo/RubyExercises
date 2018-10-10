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

number = Palindromo.new(999)
puts number.palindromic
