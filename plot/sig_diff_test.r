library(readr)
library(exactRankTests)
library(knitr)
library(xtable)

alpha <- c(5,10,15,20)

x <- read_csv("../normalP30_D30.csv", skip = 0,col_names=FALSE)
x <- x[,-52]
x <- as.matrix(x)
out <- file("../all_sig_diff.csv", "w") 
for (i in 1:4) {
  file_name <- paste("../alpha",alpha[i],"_P30_D30.csv", sep="")
  y <- read_csv(file_name,skip = 0,col_names=FALSE)
  y <- y[,-52]
  y <- as.matrix(y)
  for (j in 1:15) {
    result <- wilcox.exact(x[j,], y[j,],paired=F)
        # result2 <- wilcox.exact(shade_with, shade_wo, paired=F)
        # print(result)
        if (result$p.value > 0.05){
          # print(alpha[i])
          # print(j)
          writeLines("む", out, sep="")
          # print("む")
        }else{
          if(mean(x[j,]) > mean(y[j,])){
            writeLines("+", out, sep="")
            # print("+")
          }else{
            writeLines("-", out, sep="")
          }
        }
        if(j!=15){
          writeLines("", out, sep=", ")
        }else{
          writeLines("", out, sep="\n")
        }
  }
}
  # file_name <- paste("../last",alpha[i],"_P10_D30.csv", sep="")
  y <- read_csv("../lastP30_D30.csv",skip = 0,col_names=FALSE)
  y <- y[,-52]
  y <- as.matrix(y)

  for (j in 1:15) {
    result <- wilcox.exact(x[j,], y[j,],paired=F)
        # result2 <- wilcox.exact(shade_with, shade_wo, paired=F)
        print(result)
        if (result$p.value > 0.05){
          # print(alpha[i])
          # print(j)
          writeLines("む", out, sep="")
          # print("む")
        }else{
          if(mean(x[j,]) > mean(y[j,])){
            writeLines("+", out, sep="")
            # print("+")
          }else{
            writeLines("-", out, sep="")
          }
        }
        if(j!=15){
          writeLines("", out, sep=", ")
        }else{
          writeLines("", out, sep="\n")
        }
  }
 close(out) 


