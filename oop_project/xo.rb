 $arr = [
  ["0 0", "0 1", "0 2"],
  ["1 0", "1 1", "1 2"],
  ["2 0", "2 1", "2 2"]
]
$mov=0
$players = {}
class Board
    def win(t)
        if t=="o" && $players[:p1]=='o'
            puts "player 1 wins"
            exit 0
        elsif t=='o'&& $players[:p2]=='o'
            puts "player 2 wins"
            exit 0
        elsif t=='x' && $players[:p1]=='x'
            puts "player 1 wins"
            exit 0
        else 
            puts "player 2 wins"
            exit 0
        end



    end#end of win
#########################################
  def mark(tem)
    $mov+=1

    loop do
      print "Enter the position you want to mark in the grid above (ex:0 0): "
      a, b = gets.chomp.split.map(&:to_i)#to split the number taken from user

      if (0..2).include?(a) && (0..2).include?(b)
        if $arr[a][b] != "x" && $arr[a][b] != "o"
          $arr[a][b] = tem
          break
        else
          puts "Position already taken."
        end
      else
        puts "Position entered not valid."
      end
    end
  end#end of mark()
  ########################################
  def check()#checking for row match
    cnto = 0
    cntx = 0
  
    for i in (0..2)
      for j in (0..2)
        if $arr[i][j] == "x"
          cntx += 1
        end
        if $arr[i][j] == "o"
          cnto += 1
        end
      end
  
      if cnto == 3
        win('o')
      end
  
      if cntx == 3
        win('x')
      end
  
      # reset counters for next row
      cntx = 0
      cnto = 0
    end
##############################################    
  end#end of check
  def checkc()#checking for column match
    cnto = 0
    cntx = 0
  
    for i in (0..2)
      for j in (0..2)
        if $arr[j][i] == "x"
          cntx += 1
        end
        if $arr[j][i] == "o"
          cnto += 1
        end
      end
  
      if cnto == 3
        win('o')
      end
  
      if cntx == 3
        win('x')
      end
  
      
      cntx = 0
      cnto = 0
    end
    
  end#end of checkc
  def checkd()
    if $arr[0][0]==$arr[1][1] && $arr[1][1]==$arr[2][2]
        win( $arr[0][0])#passing the sym of winner
    end
    if $arr[0][2]==$arr[1][1] && $arr[1][1]==$arr[2][0]
        win( $arr[0][2])
    end

  end#checking the diagonals
  


        


end#end  of class

def matp
  $arr.each do |v|
    puts v.inspect
  end
end#funtion to print matrix

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#

##void main()//for those who know c########
board1 = Board.new
board1.checkd
flag = true
puts 'player one please choose a "x" or "o"(if any char then those selected it will be consider "o") '
sy = gets.chomp.downcase


if sy == "x"
  $players[:p1] = "x"
  $players[:p2] = "o"
else
  $players[:p1] = "o"
  $players[:p2] = "x"
end  # end of symbol selection if-else

matp
loop do
    if $mov == 9
        puts "It's a draw!"
        break
      end
    if $mov>3
        board1.check
        board1.checkc
        board1.checkd
    end#to check the borad for match
    
  if flag == true
    puts "player 1 turn to play:"
    m = $players[:p1]
  else
    puts "player 2 turn to play:"
    m = $players[:p2]
  end

  board1.mark(m)
  matp
  puts "press q to give up or any key to continue"
  break if gets.chomp == "q"
  flag = !flag  # switch player flag
  
end  # end of main loop
