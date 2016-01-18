require 'csv'
require 'fileutils'

population = [10, 30, 50]
dim = [2, 10, 30, 50, 100]

def file_read(file_name, d_name)
  array = []
  Dir[file_name].each do |file|
    *scores = CSV.read(file)
    array << (scores.map { |e| e[0] }).unshift(d_name)
  end
  # p array.length
  # p array[0].length
  # p array.last.length
  # p array.map { |e| e.slice(0...2000)}
  return array.map { |e| e.slice(0...2000)}
end

d_name = ["fitness_de_with_archive", "fitness_de_wo_archive"]

func_num = 1
func_nums = [10, 12]
func_names = ["griewangk_fitness","rastrigin_fitness"]
func_nums.each_with_index do |f_n, func_name|
population.each do |pop|
  dim.each do |d|
    CSV.open("#{func_names[func_name]}/pop#{pop}dim#{d}.csv", "w") do |out|
      d_name.each do |dir|
        file_name = "../#{dir}/func#{f_n}_P#{pop}_D#{d}_*.csv"
        array = file_read(file_name, dir)
        array.each do |a|
          out << a
        end
      end
    end
  end
end
end