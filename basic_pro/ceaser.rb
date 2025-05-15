def ceaser_cipher(str,n)
  str2=""
  str.each_char do |i|
    if i>='a' && i<='z'
            shift=((i.ord - "a".ord + n)%26)+"a".ord#.ord gives asii , i - a(to get base 0) then %26 to wrap 
            str2=str2+shift.chr

    end
    
  end
    return str2
end
print("enter string:")
str=gets
puts ceaser_cipher(str,2)

