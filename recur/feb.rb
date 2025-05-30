def febo(n)
    if n<=1
      return n
    end
     
   return febo(n-1)+febo(n-2)
   
end

p febo(5)