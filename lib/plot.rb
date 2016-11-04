require "gnuplot"

class Plot
  def graph(data, name = "new", title = nil)
    plot = Gnuplot.open do |gp|
      Gnuplot::Plot.new(gp) do |plot|
        plot.title(title)

        data.each_with_index do |d, i|
          x = d.points.collect { |point| point.x }
          y = d.points.collect { |point| point.y }

          x << d.centroid.x
          y << d.centroid.y

          plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
            ds.notitle
          end
          plot.terminal('png size 800,800 font "Courier" 10')
        end
      end
    end
    File.write("#{name}.png", plot)
  end
end
