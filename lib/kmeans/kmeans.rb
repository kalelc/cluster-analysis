module Kmeans
  class Kmeans
    attr_reader :data, :k, :clusters, :history

    def initialize(data, k, iteration = 10)
      @data = data
      @k = k
      @iteration = iteration
      @clusters = []
      @history = []
    end

    def run
      assigment_step
      update_step
    end

    def assigment_step
      (1..@k).each do |cluster|
        index = (@data.length * rand).to_i
        point = Point.new(@data[index].first, @data[index].last)
        @clusters << Cluster.new(point)
      end
      group_elements
    end

    def update_step
      @iteration.times do
        moved = 0
        @clusters.each do |c|
          moved += c.centroid!
        end

        group_elements
        break if moved == 0
      end
    end

    private
    def group_elements
      @data.each do |d|
        distance = []
        @clusters.each_with_index do |cluster, index|
          distance[index] = Point.distance(cluster.centroid.to_a, d)
        end
        a, b = distance.each_with_index.min
        @clusters[b].points << Point.new(d.first, d.last)
      end
      @history << @clusters
      return @clusters
    end
  end
end
