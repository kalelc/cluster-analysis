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

    class << self
      def to_rad(val)
        val * Math::PI / 180
      end

      def distance(loc1, loc2)
        lat1, lon1 = loc1
        lat2, lon2 = loc2
        dLat = self.to_rad(lat2 - lat1);
        dLon = self.to_rad(lon2 - lon1);
        a = (dLat * dLat/4) + Math.cos(self.to_rad(lat1)) * Math.cos(self.to_rad(lat2)) * dLon * dLon / 4;
        a = 1.0 if a > 1
        a = 0.0 if a < 0
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        return 6371 * c;
      end
    end
  end
end
