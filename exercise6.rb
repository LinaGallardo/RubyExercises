#Create a method that receives a word and return if it is palindrome or not.

def palindromic_word(words)
  words.eql?(words.reverse) ? "This is a palindromic word" : "This is not a palindromic word"
end

print "Enter a word: "
word = gets.chomp.downcase 

puts palindromic_word(word)
