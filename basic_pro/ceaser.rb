def ceaser_cipher(str,n)
  str2=""
  str.each_char do |i|
    if i>='a' && i<='z'
            shift=((i.ord - "a".ord + n)%26)+"a".ord
            str2=str2+shift.chr

    end
    
  end
    return str2
end
str="hello"
puts ceaser_cipher(str,2)
