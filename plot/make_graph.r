library(exactRankTests)
library(knitr)
library(xtable)


for (i in 1:15) {
    file_name = paste("final/func", i, ".csv" , sep = "")
    x <- read.csv(file_name, header = FALSE)

    x[,-1] <- log10(x[,-1])
    for (j in 1:ncol(x)) {
      x[,j] <- ifelse(is.infinite(x[,j]),NA,x[,j])
    }

    xaxis <- 1:ncol(x[, -1])          # x 軸座標を設定
    cols <- c("red", "blue", "green", "black") # PF を赤色、C を青色、G を緑色
    # 準備
    plot(0, 0, type = "n", xlim = range(xaxis), ylim = range(x[, -1],na.rm=TRUE),
         xlab = "generation number", ylab = "average distance to centroid")

    # 平均値と標準偏差を計算して、書き加える
    type <- unique(x[, 1])             # DEの種類を取得
    # type <- x[,1]
    y <- x[c(1,ncol(x))]
  for (k in 1:length(type)) {
    m <- apply(x[x[, 1] == type[k], -1], 2, mean)
    s <- apply(x[x[, 1] == type[k], -1], 2, sd)
    # print(mean(y[y[, 1] == type[k], -1], na.rm=TRUE))
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

  # グラフに凡例を書き入れる
  legend("topleft", legend = type, pch = 1, lty = 1, col = cols)

}
