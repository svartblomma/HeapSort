NUM = 1000000.freeze
$h = Array.new

def pushDown!(pos, n)
  while 2*pos + 1 < n
    j = 2*pos + 1
    if (j+1 < n) and ($h[j+1] > $h[j])
      j += 1
    end

    break unless $h[pos] < $h[j]

    $h[pos], $h[j] = $h[j], $h[pos]
    pos = j
  end
end

t1 = Time.now
  NUM.times do |i|
    $h << i
  end

  (NUM/2).downto(0) do |i|
    pushDown! i, NUM
  end

  n = NUM
  while n > 1
    $h[0], $h[n-1] = $h[n-1], $h[0]
    n -= 1
    pushDown! 0, n
  end

  NUM.times do |i|
    raise "h[i] != i" unless $h[i] == i
  end
t2 = Time.now
delta = t2 - t1
puts "Heap sort complete in #{delta * 1000 }ms for #{NUM} items"