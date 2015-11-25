require 'gnuplot'
require 'csv'

array = []
headers =[]
min_array = []
max_array = []
var_array = []
Dir["../csvs_shade_wo_archive/*.csv"].each do |file|
  header, *scores = CSV.read(file)
  headers << header[0]
  array << scores.map { |e| e[0].to_f  }
  CSV.foreach(file, headers: true) do |row|
  end
end

array = array.transpose

array.each do |a|
  sum = 0
  max = 0
  min = 10000000
  a.each do |a1|
    min = a1 if a1 < min
    max = a1 if a1 > max
    sum += a1
  end
  min_array << min
  max_array << max
  var_array << sum/array.length
end


p var_array





Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.terminal "png font 'IPA P ゴシック' fontscale 1.2"
    plot.output   "gnuplot.png"
    plot.title    "アーカイブありと無しの際の分散値の差異"
    plot.xlabel   "世代数"
    plot.ylabel   "variance"
    plot.grid

    x = (1..array.length).to_a
    y = var_array.map { |e| Math.log(e) }

    plot.data << Gnuplot::DataSet.new([x, y]) do |ds|
      ds.with      = "lines"
      # ds.linewidth = 2
      ds.linecolor = 3
      ds.notitle
    end

    # plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
    #   ds.with = "lines"
    #   ds.notitle
    # end
  end
end

