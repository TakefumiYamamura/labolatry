library(readr)
library(exactRankTests)
library(knitr)
library(xtable)

alpha <- c(5,10,15,20)

x <- read_csv("../normalP10_D30.csv", skip = 0,col_names=FALSE)
x <- x[,-52]
x <- as.matrix(x)

for (i in 1:4) {
  file_name <- paste("../alpha",alpha[i],"_P10_D30.csv", sep="")
  y <- read_csv(file_name,skip = 0,col_names=FALSE)
  y <- y[,-52]
  y <- as.matrix(y)
  for (j in 1:5) {
    result <- wilcox.exact(x[j,], y[j,],paired=F)
        # result2 <- wilcox.exact(shade_with, shade_wo, paired=F)
        # print(result)
        if (result$p.value > 0.05){
          print(alpha[i])
          print(j)
          print("有意じゃない")
        }
  }
}


