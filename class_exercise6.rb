#Create a method that receives a word and return if it is palindrome or not.

class PalindromicWords

  def initialize(word)
    @word = word
  end

  def palindromic_word
    @word.eql?(@word.reverse) ? "This is a palindromic word" : "This is not a palindromic word"
  end

end

print "Enter a word: "
word = gets.chomp.downcase
words = PalindromicWords.new(word)
puts words.palindromic_word
