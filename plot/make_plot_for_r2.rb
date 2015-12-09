# require 'gnuplot'
require 'csv'
require 'fileutils'

# header = ["date", "name", "count"]

# csv_data = CSV.open("test.csv", "w") do |csv|
#   csv << [Date.today, "Hiroki Akiyama", 6]
# end


def file_read(file_name)
  array = []
  headers =[]
  min_array = []
  max_array = []
  var_array = []
  Dir[file_name].each do |file|
    *scores = CSV.read(file)
    # headers << header[0]
    array << scores.map { |e| e[0].to_f  }
    CSV.foreach(file, headers: true) do |row|
    end
  end

  array = array.transpose

  array.each do |a|
    sum = 0
    max = 0
    min = 100000000000
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

  return var_array, min_array, max_array
end

d_name = ["csvs_length_de_with_archive_D10","csvs_length_de_wo_archive_D10","csvs_length_de_with_archive_D10","csvs_length_de_wo_archive_D10"]
d_name.each do |d|
  (1..15).each do |func_num|
    file_name = "../#{d}/func#{func_num}_*.csv"
    array = file_read(file_name)
    # p array
    File.open("#{d}/func#{func_num}.csv","a") do |file|
      file.puts "分散, min, max"
    end
    CSV.open("#{d}/func#{func_num}.csv", "w") do |out|
      array[0].length.times do |i|
        out << [array[0][i], array[1][i], array[2][i]]
      end
    end
  end
end



# Gnuplot.open do |gp|
#   Gnuplot::Plot.new(gp) do |plot|
#     plot.terminal "png font 'IPA P ゴシック' fontscale 1.2"
#     plot.output   "gnuplot.png"
#     plot.title    "with archive/ wo archive における世代ごとの標準偏差"
#     plot.xlabel   "世代数"
#     plot.ylabel   "std"
#     plot.grid

#     #min_array, max_array, var_array

#     a = file_read("../csvs_length_de_wo_archive/*.csv")
#     p a[2].length

#     x = (1..2000).to_a
#     y = a[2].map { |e| Math.log(e) }

#     p y.length

#     plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
#       ds.with      = "lines"
#       # ds.linewidth = 2
#       ds.linecolor = 3
#       ds.notitle
#     end
#     #青アーカイブなし
#     #赤アーカイブあり

#     a = file_read("../csvs_length_de_with_archive/*.csv")

#     x = (1..2000).to_a
#     y = a[2].map { |e| Math.log(e) }

#     plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
#       ds.with      = "lines"
#       # ds.linewidth = 2
#       ds.linecolor = 1
#       ds.notitle
#     end

#   end
# end

