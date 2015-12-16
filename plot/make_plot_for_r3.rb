require 'csv'
require 'fileutils'

def file_read(file_name, d_name)
  array = []
  Dir[file_name].each do |file|
    *scores = CSV.read(file)
    array << (scores.map { |e| e[0] }).unshift(d_name)
  end
  return array
end

d_name = ["csvs_length_de_with_archive_D10","csvs_length_de_wo_archive_D10","csvs_length_shade_with_archive_D10","csvs_length_shade_wo_archive_D10"]


(1..15).each do |func_num|
  CSV.open("final/func#{func_num}.csv", "w") do |out|
    d_name.each do |d|
      file_name = "../#{d}/func#{func_num}_*.csv"
      array = file_read(file_name, d)
      array.each do |a|
        out << a
      end
    end
  end
end
