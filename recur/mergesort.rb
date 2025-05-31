def merge(arr,lo,mid,high)
  arr2=[]
  k=0
  a=lo
    b=mid+1
    while(a<=mid && b<=high)
      if(arr[a]<arr[b])
                arr2[k]=arr[a]
                a += 1
                # k += 1 
      else
        arr2[k]=arr[b]
         #k += 1 
        b+=1
      end#if else end
         k+=1;
    end#while end
    while (a<=mid)
            arr2[k]=arr[a]
            k+=1
            a+=1
    end

      while b <= high
    arr2[k] = arr[b]
    b += 1
    k += 1
      end
   (0...arr2.size).each do |i|
  arr[lo + i] = arr2[i]
end
end#funtion end

def mergesort(arr,lo,high)
if lo<high
  mid=(lo+high)/2

    mergesort(arr,lo,mid)
    mergesort(arr,mid+1,high)
    merge(arr,lo,mid,high)
end
end
arr = [5, 3, 8, 4, 2, 7, 1, 6]
mergesort(arr, 0, arr.length - 1)
puts "Sorted array: #{arr}"
