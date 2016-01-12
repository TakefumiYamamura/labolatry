library(Hmisc)
library(readr)

# サンプルデータを作成
data <- read_csv("../last_table.csv", skip=0)
data <- t(data)
# data <- matrix(1:20, ncol = 5, nrow = 4)
colnames(data) <- c("DE", "DE\nalpha=(0.5)", "DE\nalpha=(1.0)", "DE\nalpha=(1.5)", "DE\nalpha=(2.0)", "DE(提案手法2)")
# rownames(data) <- c("F1", "F2", "F3", "F4","F5","F6", "F7", "F8", "F9","F10","F11", "F12", "F13", "F14","F15")

latex(
  data,                        # 配列型のデータ
  file="",                     # LaTeX ファイルの保存先
  title="F",              # 1 行 1 列目のセルの内容
  label="ref-tb-values",       # LaTeX の \label に相当
  caption="提案手法と通常のDEの比較実験"  # LaTeX の \caption に相当
)