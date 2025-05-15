def substring(str,dic)
   res=Hash.new(0)
   str_downed=str.downcase
   dic.each do |substr|
         arr=str_downed.scan(substr)#this will give array of matched words
         cnt=arr.length
         if cnt >0
                      res[substr]+=cnt
         end
   end
   print res
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
 ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit","hello"]
 
 print("enter the string to be searched:")
 som=gets 
 substring(som, dictionary)