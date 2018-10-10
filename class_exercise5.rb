#As an engineer, I must create a method that receives any number and returns the Factorial of that number.

class FactorialNumber

  def initialize(num)
    @num = num
  end 

  def factorial 
    @num.zero? ? "1" : @num.downto(1).inject(:*)
  end

end

print "Enter a number: "
num = gets.chomp.to_i 
number = FactorialNumber.new(num)
puts "The factorial number of #{ num } is #{ number.factorial } "
