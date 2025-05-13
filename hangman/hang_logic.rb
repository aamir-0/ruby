module LOGIC
  def check(word,g,guess)
    if word.include?(g)
     for i in (0..word.length)
       if g==word[i]
         guess[i]=g
       end
    end
  else
    puts "wrong guess"
  end
end
def print_hangman(wrong_guesses)
  stages = [
    """
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      / \\
    |
    |___
    """,
    """
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      / 
    |
    |___
    """,
    """
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      
    |
    |___
    """,
    """
     _______
    |/      |
    |      (_)
    |      \\|
    |       |
    |      
    |
    |___
    """,
    """
     _______
    |/      |
    |      (_)
    |       |
    |       |
    |      
    |
    |___
    """,
    """
     _______
    |/      |
    |      (_)
    |      
    |       
    |      
    |
    |___
    """,
    """
     _______
    |/      |
    |      
    |      
    |       
    |      
    |
    |___
    """
  ]
  
  # Make sure index is in range
  puts stages[[6 - wrong_guesses, 6].min]
end

end