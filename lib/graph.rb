require "gnuplot"
require 'RMagick'
include Magick

class Graph
  class << self
    def create(data, name = "new", title = nil)
      plot = Gnuplot.open do |gp|
        Gnuplot::Plot.new(gp) do |plot|
          plot.title(title)

          data.each_with_index do |d, i|
            x = d.points.collect { |point| point.x }
            y = d.points.collect { |point| point.y }

            x << d.centroid.x
            y << d.centroid.y

            plot.data << Gnuplot::DataSet.new([x,y]) { |ds|
              ds.notitle
              ds.linewidth = 2
            }

            plot.terminal('png size 1000, 1000')
          end
        end
      end
      File.write("#{name}.png", plot)
    end

    def animate
      animation = ImageList.new(*Dir["*.png"])
      animation.delay = 10
      animation.write("animated.gif")
    end
  end
end
