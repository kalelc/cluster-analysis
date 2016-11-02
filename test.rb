require "faker"
require_relative "lib/kmeans/kmeans"

class Test
  def initialize
    data = [] ; (1..50).each do |i|; data << [Faker::Address.latitude.to_f, Faker::Address.longitude.to_f]; end; k = Kmeans::Kmeans.new(data, 4);
    k.run
  end
end

Test.new
