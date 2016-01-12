require 'csv'
require 'fileutils'

firstline = ["$F_{1}$","$F_{2}$","$F_{3}$","$F_{4}$","$F_{5}$","$F_{6}$","$F_{7}$","$F_{8}$","$F_{9}$","$F_{10}$","$F_{11}$","$F_{12}$","$F_{13}$","$F_{14}$","$F_{15}$"]

population = [10, 30, 50]
dim = [2, 10, 30, 50, 100]

CSV.open("../last_table.csv", "w") do |out|
  out << firstline
  fit = CSV.read("../all_fitness.csv")
  p fit
  std = CSV.read("../all_std.csv")
  p std
  sym = CSV.read("../all_sig_diff.csv")
  array = []
  fit.length.times do |i|
    array << []
    fit[0].length.times do |j|
      if i == 0
        array[i] << "#{fit[i][j]}\(#{std[i][j]}\)"
      else
        array[i] << "#{fit[i][j]}\(#{std[i][j]}\)#{sym[i-1][j]}"
      end
    end
  end

  array.each do |a|
    out << a
  end

end
