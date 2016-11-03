require "faker"
require_relative "lib/kmeans/kmeans"
require_relative "lib/plot"

class Test
  def initialize
    data = []
    (1..10).each do |i|
      data << [Faker::Address.latitude.to_f, Faker::Address.longitude.to_f];
    end

    k = Kmeans::Kmeans.new(data, 4)
    k.run

    data = k.clusters
    history = k.history
    history.each_with_index do |h, i|
      Plot.new.graph(h, i)
    end
  end
end

Test.new
