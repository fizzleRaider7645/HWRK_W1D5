class LRUCache
    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      @cache.count
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
        @cache.push(el)
      elsif count >= @size
        @cache.shift
        @cache << el
      end
    else
      @cache << el
    end

    def show
      @cahce
    end

  end
