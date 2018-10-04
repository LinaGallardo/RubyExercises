#As an engineer, I must create a method that receives any number and returns the Factorial of that number.

def factorial(num) 
  num.zero? ? "1" : num.downto(1).inject(:*)
end

print "Enter a number: "
number = gets.chomp.to_i 
puts "The factorial number of #{ number } is #{ factorial(number) } "
