module Kmeans
  class Point
    attr_accessor :x, :y

    def initialize(x,y)
      @x = x
      @y = y
    end

    def to_a
      [@x, @y]
    end
  end
end
