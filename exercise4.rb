# A palindromic number reads the same both ways. The largest palindrome made from the product of
#two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def palindromic
  numbers = []
  100.upto(999).each do |num_1|
    (100..999).each do |num_2|
      numbers << (num_1 * num_2)
    end
  end
  numbers.select { |num| num.to_s.eql?(num.to_s.reverse) }.max
end
 
p palindromic
