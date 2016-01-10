  # library(exactRankTests)
  # library(knitr)
  # library(xtable)
  library(readr)
  dim <- c(2,10,30,50,100)
  # pop <- 30
  populations <- c(10, 30, 50)
  for (mu in 1:3){
    for (i in 1:5) {
      file_name <- paste("sphere_fitness/pop", populations[mu], "dim" , sep = "")
        file_name = paste(file_name, dim[i], ".csv" , sep = "")
        # x <- read.csv(file_name, header = FALSE)
        x <- read_csv(file_name, skip = 0)

        x[,-1] <- log10(x[,-1])
        for (j in 2:ncol(x)) {
          x[,j] <- ifelse(is.infinite(x[,j]),NA,x[,j])
        }

        xaxis <- 1:ncol(x[, -1])          # x 軸座標を設定
        cols <- c("red", "blue") # PF を赤色、C を青色、G を緑色
        # 準備
        plot(0, 0, type = "n", xlim = range(xaxis), ylim = range(x[, -1],na.rm=TRUE),
             xlab = "generation number", ylab = "std in fitness")
        # plot(0, 0, type = "n", xlim = c(1,2000), ylim = c(-6, 2),
        #      xlab = "generation number", ylab = "std in distance to centroid")

        # 平均値と標準偏差を計算して、書き加える
        type <- unique(x[[1]])             # DEの種類を取得
        print(x[[1]])
        # type <- x[,1]
        # y <- x[c(1,ncol(x))]
        # de_with<-y[y[, 1] == type[1], -1]
        # de_wo <-y[y[, 1] == type[2], -1]
        # shade_with<-y[y[, 1] == type[3], -1]
        # shade_wo<-y[y[, 1] == type[4], -1]
        # result1 <- wilcox.exact(de_with, de_wo,paired=F)
        # result2 <- wilcox.exact(shade_with, shade_wo, paired=F)
        # if (result1$p.value > 0.05){
        #   print("有意じゃない")
        # }
        # if (result2$p.value > 0.05){
        #   print("有意じゃない関数")
        #   print(i)
        # }

      for (k in 1:length(type)) {
        m <- apply(x[x[, 1] == type[k], -1], 2, mean)
        s <- apply(x[x[, 1] == type[k], -1], 2, sd)
        lines(xaxis, m, col = cols[k])
        xaxis_n <- c()
        m_n <- c()
        s_n <- c()
        for (j in 1:length(xaxis)) {
          if (j %% 100 == 0){
            xaxis_n <- append(xaxis_n, xaxis[j])
            m_n <- append(m_n, m[j])
            s_n <- append(s_n, s[j])
          }
        }
        arrows(xaxis_n, m_n + s_n, xaxis_n, m_n - s_n, angle = 90, length = 0.05, col = cols[k])
        arrows(xaxis_n, m_n - s_n, xaxis_n, m_n + s_n, angle = 90, length = 0.05, col = cols[k])
      }
      eps <- paste("eps/P", populations[mu], "fitD", sep="")
      out_put_file_name <- paste(eps, dim[i], ".eps" , sep = "")
      # dev.copy2eps(file = "myFigure.eps")
      dev.copy2eps(file = out_put_file_name)
      # pictex(file = "plot_test.tex")

      # グラフに凡例を書き入れる
      # legend("topleft", legend = type, pch = 1, lty = 1, col = cols)

    }
  }
