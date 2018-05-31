def sluggish_octopus(array)

   loop do
     swapped = false
     (array.length - 1).times do |i|
       if array[i] > array[i + 1]
         array[i], array[i + 1] =  array[i + 1], array[i]
         swapped = true
       end
     end
     break unless swapped
   end
   array.last
end

def merge_sort
  merge(left, right)
end

def dominant_octopus(array)
  return array if array.length == 1
  mid = array.length / 2

  sorted_left = dominant_octopus(array.take(mid))
  sorted_right = dominant_octopus(array.drop(mid))

  merge(sorted_left, sorted_right)
  merge_sort
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1
    merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged.last
end

def clever_octopus(array)
  longest = ''
  array.each do |fish|
    longest = fish if longest == "" || fish.length > longest.length
  end
  longest
end



TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
TENTACLES = (0..8).to_a
TILES_HASH = {"up": 0
              "right-up": 1
              "right": 2
              "right-down": 3
              "down": 4
              "left-down": 5
              "left": 6
              "left-up": 7
            }

def slow_dance(direction)
  TILES_ARRAY.each_with_index { |move, idx| return idx if move == direction }
end

def constant_dance(direction)
  TILES_HASH[direction]
end
