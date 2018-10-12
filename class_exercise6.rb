#Create a method that receives a word and return if it is palindrome or not.

class PalindromicWords

  def initialize(word)
    @word = word.downcase
  end

  def palindromic_word
    @word.eql?(@word.reverse) ? "It is palindromic" : "It is not palindromic"
  end
  
end

#----------------Test------------------

require 'minitest/autorun'

class PalindromicWordsTest < Minitest::Test

  def setup 
    @word_1 = PalindromicWords.new("Oso")
    @word_2 = PalindromicWords.new("Hola")
  end

  def test_instance_of_palindromic_words
    assert_instance_of(PalindromicWords, @word_1)
    assert_instance_of(PalindromicWords, @word_2)
  end

  def test_palindromic_words_true
    assert_equal("It is palindromic", @word_1.palindromic_word)
  end

  def test_palindromic_words_false
    assert_equal("It is not palindromic", @word_2.palindromic_word)
  end

end

#----------------TestSpecs------------------

describe PalindromicWords do

  before do
    @word_1 = PalindromicWords.new("Reconocer")
    @word_2 = PalindromicWords.new("Casa")
  end

  describe "when insert a word" do
    it "result must be true" do
      @word_1.palindromic_word.must_equal "It is palindromic"
    end
  end

  describe "when insert incorrect word" do
    it "result must be false" do
      @word_2.palindromic_word.must_equal "It is not palindromic"
    end
  end

end
