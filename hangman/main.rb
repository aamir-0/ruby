require_relative "word_picker"
require_relative "hang_logic"
include LOGIC

word=pick_random_word
puts 'Welcome to tha Hangman Game'
puts "the word length is #{word.length} :"
guess=Array.new(word.length,"_")
puts 'start gussing'
cnt=7
display(word)
while cnt>=1
puts"Enter the next guess(guess left #{cnt}):"
print guess
g=gets.chomp.downcase
 if check(word,g,guess)
    puts'good guess'
 else
    puts 'try again'
    print_hangman(7-cnt)
    cnt=cnt-1
 end
 if !guess.include?("_")
    puts "You win the game"
    exit()
 end

end
puts "The man was hunged, The word was:"
display(word)

