module Kmeans
  class Plot
    attr_reader :clusters, :history

    def initialize(i = 10, k = 10)
      @data = []
      data = []

      (1..i).each do |i|
        data << [Faker::Address.latitude.to_f, Faker::Address.longitude.to_f]
      end

      kmeans = Kmeans.new(data, k)

      @data = kmeans.assigment_step
      graph
      #@data = kmeans.update_step
      #graph
    end

    def graph_history
      @history.each_with_index do |h, i|
        @data = h
        graph(i)
      end
    end

    def graph(name = "new", title = nil)
      plot = Gnuplot.open do |gp|
        Gnuplot::Plot.new(gp) do |plot|
          plot.title(title)

          @data.each do |data|
            x = data.points.collect {|point| point.x }
            y = data.points.collect {|point| point.y }

            plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
              ds.notitle
            end
            #plot.terminal('png size 800,800 font "Courier" 10')
          end
        end
      end
      #File.write("#{name}.png", plot)
    end
  end
end
