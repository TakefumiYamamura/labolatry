require 'gnuplot'
require 'csv'

def file_read(file_name)
  array = []
  headers =[]
  min_array = []
  max_array = []
  var_array = []
  Dir[file_name].each do |file|
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
    var = sum/a.length
    min_array << var - min
    max_array << max - var
    var_array << var
  end

  return min_array, max_array, var_array
end


Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.terminal "png font 'IPA P ゴシック' fontscale 1.2"
    plot.output   "gnuplot.png"
    plot.title    "with archive/ wo archive における世代ごとの標準偏差"
    plot.xlabel   "世代数"
    plot.ylabel   "std"
    plot.grid

    #min_array, max_array, var_array

    a = file_read("../csvs_shade_wo_archive/*.csv")
    p a[2].length

    x = (1..2000).to_a
    y = a[2].map { |e| Math.log(e) }

    p y.length

    plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
      ds.with      = "lines"
      # ds.linewidth = 2
      ds.linecolor = 3
      ds.notitle
    end
    #青アーカイブなし
    #赤アーカイブあり

    a = file_read("../csvs_shade_with_archive/*.csv")

    x = (1..2000).to_a
    y = a[2].map { |e| Math.log(e) }

    plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
      ds.with      = "lines"
      # ds.linewidth = 2
      ds.linecolor = 1
      ds.notitle
    end

  end
end

