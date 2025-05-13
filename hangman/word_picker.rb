def pick_random_word
file=File.open("words_1000.txt", "r")
words= file.readlines.sample(10).map(&:chomp)
word=words.select{|w| w.length > 5 && w.length < 12}.sample
file.close
word.downcase
end
def display(word)
  word.each_char do |v|
    print v
  end
end



