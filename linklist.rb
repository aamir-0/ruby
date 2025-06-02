class Node
    attr_accessor :val,:next
    def initialize(val)
    @val=val
    @next=nil
    end
    def to_s
            "val=#{val}"
    end

   
end


class Linklist
  attr_reader :head
  attr_reader :tail
    def initialize
            @head=nil
            @tail=nil
    end
      def insert(val)#insert works as append
                new=Node.new(val)
                if @head==nil
                      @head=new 
                      @tail=new
                else
                  curr=@head
                  while curr.next
                        curr=curr.next                
                  end
                  curr.next=new
                  @tail=new
                end            

      end#end of insert
   
      def display
                cur=@head
                while cur.next
                    print"#{cur.val}-> "
                    cur=cur.next
                end
                print "#{cur.val}->"
                print "nil"
      end

      def prepend(val)
        tem=Node.new(val)
        cur=@head
        @head=tem
        tem.next=cur
      end
      def count
                cur=@head
                cnt=0
                while cur.next
                    cnt+=1
                    cur=cur.next
                end
                return cnt+1
      end
      def at(ind)
        if ind<0 || ind>self.count
                    return 'index out of range'
        end
        
        while ind!=0
                    cur=@head
                    cur=cur.next
                    ind-=1
        end
        return cur.val
                
      end

      def pop
        return nil if @head.nil? 

                cur=@head
                while cur.next
                  prev=cur
                      cur=cur.next
                end
                prev.next=nil
                @tail=prev
                return "element #{cur.val} poped"

      end
    
end
obj=Linklist.new
obj.insert('animal')
obj.insert(40)
obj.insert(90)
obj.insert(110)
obj.insert(20)
obj.prepend(0)
obj.display()
p obj.tail.to_s
p obj.at(20)

p obj.count 
obj.pop

obj.display()