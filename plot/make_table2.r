make_name <- function(dir, i) {
  name1 <- paste(dir,"/func", sep="")
  name2 <- paste(name1, i, sep="")
  name3 <- paste(name2,".csv", sep="")
  return(name3)
}

dir_name <- c("csvs_length_shade_with_archive_D10","csvs_length_shade_wo_archive_D10","csvs_length_de_with_archive_D10","csvs_length_de_wo_archive_D10")

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
  g_num <- seq(1, 1998, by=100)

  average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=data1[,1], csvs_length_de_wo_archive_D10=data2[,1])


  average_distance_to_centroid_log1 <- c()
  average_distance_to_centroid_log1_max <- c()
  average_distance_to_centroid_log1_min <- c()
  for (j in data1[,1]) {
    average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1,log10(as.numeric(j)))
  }
  for (j in data1[,3]){
    average_distance_to_centroid_log1_max <- append(average_distance_to_centroid_log1_max, log10(as.numeric(j)))
  }
  for (j in data1[,2]){
    average_distance_to_centroid_log1_min <- append(average_distance_to_centroid_log1_min, log10(as.numeric(j)))
  }


  average_distance_to_centroid_log2 <- c()
  average_distance_to_centroid_log2_max <- c()
  average_distance_to_centroid_log2_min <- c()
  for (j in data2[,1]) {
    average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2,log10(as.numeric(j)))
  }
  for (j in data2[,3]){
    average_distance_to_centroid_log2_max <- append(average_distance_to_centroid_log2_max, log10(as.numeric(j)))
  }
  for (j in data2[,2]){
    average_distance_to_centroid_log2_min <- append(average_distance_to_centroid_log2_min, log10(as.numeric(j)))
  }

  average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=average_distance_to_centroid_log1, csvs_length_de_wo_archive_D10=average_distance_to_centroid_log2)

  # plot(x, data[,1],type='l' )
  # type <- c("de_w/a","de_wo/a")
  cols <- c("black", "red")
  # plot(generation_number, average_distance_to_centroid, type='l')

  # plot(0, 0, type = "n", xlim = range(generation_number), ylim = range(data1),xlab = "世代数", ylab = "重心への距離の平均")
  #legend("topleft", legend = type, lty = 1, col = cols)
  matplot(generation_number, average_distance_to_centroid, type='l')
  arrows(generation_number,average_distance_to_centroid_log1_max,generation_number, average_distance_to_centroid_log1_min, angle = 90, length=0.1, col = cols[1])
  arrows(generation_number,average_distance_to_centroid_log1_min,generation_number, average_distance_to_centroid_log1_max, angle = 90, length=0.1, col = cols[1])

  arrows(generation_number,average_distance_to_centroid_log2_max,generation_number, average_distance_to_centroid_log2_min, angle = 90, length=0.1, col = cols[2])
  arrows(generation_number,average_distance_to_centroid_log2_min,generation_number, average_distance_to_centroid_log2_max, angle = 90, length=0.1, col = cols[2])

  out_put_file = paste("eps/func", i, ".eps" , sep = "")
  pictex(file = out_put_file)
}

#黒がwith arc


# for (i in 1:15) {
#   name1 <- make_name(dir_name[1], i)
#   data1 <- read.csv(name1)
#   name2 <- make_name(dir_name[2], i)
#   data2 <- read.csv(name2)
#   # d1 <- data1[,1]
#   # for (j in 1:length(d1)) {d1[j] <- log10(d1[j])}
#   # d12 <- data2[,1]
#   # for (j in 1:length(d2)) {d2[j] <- log10(d2[j])}

#   generation_number <- 1:1998

#   average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=data1[,1], csvs_length_de_wo_archive_D10=data2[,1])


#   average_distance_to_centroid_log1 <- c()
#   average_distance_to_centroid_log1_max <- c()
#   average_distance_to_centroid_log1_min <- c()
#   for (j in data1[,1]) {
#     average_distance_to_centroid_log1 <- append(average_distance_to_centroid_log1,log10(as.numeric(j)))
#   }
#   for (j in data1[,2]){
#     average_distance_to_centroid_log1_max <- append(average_distance_to_centroid_log1_max, log10(as.numeric(j)))
#   }
#   for (j in data1[,3]){
#     average_distance_to_centroid_log1_min <- append(average_distance_to_centroid_log1_min, log10(as.numeric(j)))
#   }


#   average_distance_to_centroid_log2 <- c()
#   average_distance_to_centroid_log2_max <- c()
#   average_distance_to_centroid_log2_min <- c()
#   for (j in data1[,1]) {
#     average_distance_to_centroid_log2 <- append(average_distance_to_centroid_log2,log10(as.numeric(j)))
#   }
#   for (j in data1[,2]){
#     average_distance_to_centroid_log2_max <- append(average_distance_to_centroid_log2_max, log10(as.numeric(j)))
#   }
#   for (j in data1[,3]){
#     average_distance_to_centroid_log2_min <- append(average_distance_to_centroid_log2_min, log10(as.numeric(j)))
#   }

#   average_distance_to_centroid <- data.frame(csvs_length_de_with_archive_D10=average_distance_to_centroid_log1, csvs_length_de_wo_archive_D10=average_distance_to_centroid_log2)

#   # plot(x, data[,1],type='l' )
#   # type <- c("de_w/a","de_wo/a")
#   cols <- c("red", "blue")
#   # plot(generation_number, average_distance_to_centroid, type='l')

#   # plot(0, 0, type = "n", xlim = range(generation_number), ylim = range(data1),xlab = "世代数", ylab = "重心への距離の平均")
#   #legend("topleft", legend = type, lty = 1, col = cols)
#   matplot(generation_number, average_distance_to_centroid, type='l')
#   arrows(generation_number,average_distance_to_centroid_log1_max,generation_number, average_distance_to_centroid_log1_min, angle = 90, length=0.1, col = cols[1])
#   arrows(generation_number,average_distance_to_centroid_log1_min,generation_number, average_distance_to_centroid_log1_max, angle = 90, length=0.1, col = cols[1])

#   arrows(generation_number,average_distance_to_centroid_log2_max,generation_number, average_distance_to_centroid_log2_min, angle = 90, length=0.1, col = cols[2])
#   arrows(generation_number,average_distance_to_centroid_log2_min,generation_number, average_distance_to_centroid_log2_max, angle = 90, length=0.1, col = cols[2])

# }

# #黒がwith arc
