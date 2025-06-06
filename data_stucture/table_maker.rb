class Hashmap
def initialize
@capacity=16
@load_factor=0.75
@arr=Array.new(@capacity){ [] }
@size=0
@len=0
@temp=Array.new()
end
def hasher(key)
  
    prime=11
    hash_key=0
    key.each_char do |i|
            hash_key=hash_key * prime+i.ord
    end
    return hash_key % @capacity
end#end of hasher funtion

def resize
    old_arr = @arr
    @capacity *= 2
    @arr = Array.new(@capacity) { [] }
    @size = 0

      old_arr.flatten(1).each do |key, value|#flatten to make pairs of key and value like [["monkey"=>1],..["zebra"=>2]]
        set(key, value)#inserting old table data in new table
      end

end#end of resize
def set(key,value)
    hashed_key=hasher(key)
    bucket=@arr[hashed_key]#think of bucket(head node) as linklist

    bucket.each do |p|
             if p[0] == key
             p[1] = value
             return#update value if key already exist and return
             end
    end
   
   bucket<<[key,value]
   @len+=1#cant use size to cal it gets reset after reize
   @size+=1 
 resize if @size.to_f / @capacity > @load_factor
end#end of set
def get(key)
    hashed_key=hasher(key)
    bucket=@arr[hashed_key]#bucket will act like a ptr to arrays inside @arr

    bucket.each do |k , v|
            if k==key
                return v            
            end
                 
           
    end
end#end of get

def has?(key)
    hashed_key=hasher(key)
    bucket=@arr[hashed_key]#bucket will act like a ptr to arrays inside @arr

    bucket.each do |k , v|
      if k==key
           return true               
      end

    end
 return false               


end#end of has?

def remove(key)
    hashed_key=hasher(key)
    bucket=@arr[hashed_key]#bucket will act like a ptr to arrays inside @arr

    bucket.each_with_index do |(k , v ),ind|
            if k==key
                 bucket.delete_at(ind)
                 @size -= 1    
                  return v     
            end
    end
    return nil
end#end of remove

def length
    return @len
end#end of lenght 

def clear
    @arr.each do |b|
        b.clear
    end
    @size=0
    @len=0
end#end of clear

def keys
    return @arr.flatten(1)
end#keys end

def values
   @arr.flatten(1).each do |(k,v)|
         @temp<<v
   end
   return @temp
end#end of values

end#end of class

 test = Hashmap.new

  test.set('apple', 'red')
 test.set('banana', 'yellow')
 test.set('carrot', 'orange')
 test.set('dog', 'brown')
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')

 p test.length


 p test.get('lion')

 if test.has?('superman')
     p'superman exists'
 end
 
 
 if test.has?('kite')
     p '1 kite exists'
 end

p test.remove('kite')

if test.has?('kite')
     p '2 kite exists'
end

p test.keys
p test.values

 p test.length
 test.clear
  p test.length