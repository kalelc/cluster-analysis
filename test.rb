require "faker"
require_relative "lib/kmeans/kmeans"
require_relative "lib/graph"

class Test
  def initialize
    data = []
    srand(10)
    (1..100).each do |i|
      data << [Faker::Address.latitude.to_f, Faker::Address.longitude.to_f];
    end

    k = Kmeans::Kmeans.new(data, 10)
    k.run
  end
end

Test.new
