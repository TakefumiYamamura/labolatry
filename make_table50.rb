require "prawn/table"
require "prawn"
require "csv"

array = []

f_name1 = File.basename("DE_50")+".pdf"
# headers, *scores = CSV.read('csv/data.csv')

# CSV.open("active-enrollments.csv", "wb") do |csv|
#   csv << ["course_id", "user_name", "user_id","course_name", "status"]
# end
headers =[]
Dir["csvs/*.csv"].each do |file|
  header, *scores = CSV.read(file)
  headers << header[0]
  array << scores
  CSV.foreach(file, headers: true) do |row|
  end
end
#   #puts file
# CSV.foreach(file, :headers => true) do |row|
# if row['user_id'] && row ['course_id'] #finds enrollment csvs
#   if row['state'] == "active" #checks for active enrollments
#     state = row['state']
#     course_id = row['course_id']
#     user_id = row['user_id']
#     Dir["csvs/*.csv"].each do |files|
#       CSV.foreach(files, :headers => true) do |user|
#         if user['user_name']
#           if user_id == user['user_id']
#             user_name = user['user_name']
#             Dir["csvs/*.csv"].each do |file|
#               CSV.foreach(file, :headers => true) do |courses|
#                 if course_id == courses['course_id']
#                   course_name = courses['course_name']
#                   CSV.open("active-enrollments.csv", "a") do |csv|
#                     csv << [course_id, user_name, user_id, course_name, state]
#                   end
#                 end 
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end
# end
# end
show_array = []
std_array = []

28.times  do
  show_array << []
  std_array << []
end
array.each do |as|
  as.each_with_index do |a,i|
    show_array[i] << a[0]
    std_array[i] << a[1]
  end
end
show_array.map! do |a|
  a.flatten
end


show_array.each_with_index.map do |a, i1|
  min = 1000
  min_i = 0
  a.each_with_index do |ai,i|
    if min > ai.to_f && i != 0
      min_i = i
      min = ai.to_f
    end
  end
  a[min_i] = "<color rgb='FF00FF'>#{a[min_i]}</color>"
  a.each_with_index do |a_i, i|
    a[i] += "\n(#{std_array[i1][i]}) " if i != 0
  end
end

# p show_array
show_array.unshift(headers.flatten)

a = "適応DE性能評価 D=50"

Prawn::Document.generate(f_name1) {
  stroke_axis
  font_size 5
  font "/Library/Fonts/Microsoft/meiryo.ttf"
  text a
  move_down 20
  table show_array ,:cell_style => { :inline_format => true }
}