def  bubble_sort(arr)
len=arr.length
(0...len).each do |i|
    (0...len-i-1).each do |j|
      if arr[j]>arr[j+1]
                temp=arr[j]
                arr[j]=arr[j+1]
                arr[j+1]=temp
      end
            
    end
end

end
arr=[3,42,6,7,2,1]
bubble_sort(arr)
print arr