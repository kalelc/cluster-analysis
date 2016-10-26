module Kmeans
  class Cluster
    attr_accessor :centroid, :points

    def initialize(centroid)
      @centroid = centroid
      @points = []
    end

    def centroid!
      xa = ya = 0
      old_centroid = @centroid

      @points.each do |point|
        xa += point.x
        ya += point.y
      end

      if (total = @points.length) != 0
        xa /= total
        ya /= total
        @centroid = Point.new(xa, ya)
        @points = []
      end

      return Point.distance(old_centroid.to_a,centroid.to_a)
    end
  end
end
