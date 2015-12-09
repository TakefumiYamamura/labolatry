make_name <- function(dir, i) {
  name1 <- paste(dir,"/func", sep="")
  name2 <- paste(name1, i, sep="")
  name3 <- paste(name2,".csv", sep="")
  return(name3)
}

dir_name <- c("csvs_length_shade_with_archive_D10","csvs_length_shade_wo_archive_D10","csvs_length_de_with_archive_D10","csvs_length_de_wo_archive_D10")

# for (i in 1:15) {
#   name1 <- make_name(dir_name[1], i)
#   data1 <- read.csv(name1)
#   name2 <- make_name(dir_name[2], i)
#   data2 <- read.csv(name2)
#   generation_number <- 1:5998
#   average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=data1[,1], csvs_length_de_wo_archive_D10=data2[,1])

#   average_distance_to_centroid_log1 <- c()
#   for (j in data1[,1]) {
#     # if (j > 0.000000001){
#       # print(j)
#       average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1,log10(as.numeric(j)))
#     # } else {
#     #   average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1, 1 )
#     # }
#   }

#   average_distance_to_centroid_log2 <- c()
#   for (j in data2[,1]) {
#     # if (j > 0.000000001){
#       average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2,log10(as.numeric(j)))
#     # } else {
#     #   average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2, 1 )
#     # }
#   }
#   average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=average_distance_to_centroid_log1, csvs_length_de_wo_archive_D10=average_distance_to_centroid_log2)

#   # plot(x, data[,1],type='l' )
#   type <- c("de_w/a","de_wo/a")
#   cols <- c("red", "blue")
#   #legend("topleft", legend = type, lty = 1, col = cols)
#   matplot(generation_number, average_distance_to_centroid, type='l')
# }

for (i in 1:15) {
  name1 <- make_name(dir_name[1], i)
  data1 <- read.csv(name1)
  name2 <- make_name(dir_name[2], i)
  data2 <- read.csv(name2)
  # d1 <- data1[,1]
  # for (j in 1:length(d1)) {d1[j] <- log10(d1[j])}
  # d12 <- data2[,1]
  # for (j in 1:length(d2)) {d2[j] <- log10(d2[j])}

  generation_number <- 1:1998

  average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=data1[,1], csvs_length_de_wo_archive_D10=data2[,1])

  average_distance_to_centroid_log1 <- c()
  for (j in data1[,1]) {
    # if (j > 0.000000001){
      # print(j)
      average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1,log10(as.numeric(j)))
    # } else {
    #   average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1, 1 )
    # }
  }

  average_distance_to_centroid_log2 <- c()
  for (j in data2[,1]) {
    # if (j > 0.000000001){
      average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2,log10(as.numeric(j)))
    # } else {
    #   average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2, 1 )
    # }
  }
  average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=average_distance_to_centroid_log1, csvs_length_de_wo_archive_D10=average_distance_to_centroid_log2)

  # plot(x, data[,1],type='l' )
  type <- c("de_w/a","de_wo/a")
  cols <- c("red", "blue")
  #legend("topleft", legend = type, lty = 1, col = cols)
  matplot(generation_number, average_distance_to_centroid, type='l')
}
#黒がwith arc
