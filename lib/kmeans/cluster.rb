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
        lar = GpsWaypoints.to_rad(point.x)
        lor = GpsWaypoints.to_rad(point.y)
        xa += Math.cos(lar) * Math.cos(lor)
        ya += Math.cos(lar) * Math.sin(lor)
        za += Math.sin(lar)
      end

      if (total = @points.length) != 0
        xa /= total
        ya /= total
        za /= total
        lon = Math.atan2(ya,xa)
        hyp = Math.sqrt(xa ** 2 + ya ** 2)
        lat = Math.atan2(za,hyp)
        lat = lat * 180 / Math::PI
        lon = lon * 180 / Math::PI
        @centroid = Point.new(lat, lon)
        @points = []
      end

      return Point.distance(old_centroid.to_a,centroid.to_a)
    end
  end
end
