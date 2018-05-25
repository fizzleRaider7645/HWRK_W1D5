class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
    @stack
  end

  def show
    @stack
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
    @queue
  end

  def show
    @queue
  end

end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
  pair_index = @map.index { |pair| pair[0] = key }
  pair_index ? @map[pair_index][1] = value : @map << [key, value]
  [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
    nil
  end

  def show
    deep_dup(@map)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
