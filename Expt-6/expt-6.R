library(ggplot2)
library(tidyverse)

# Tạo dataframe
data <- data.frame(
  Mẫu = rep(c("R", "S"), each = 5),
  Số_tế_bào = c(37, 30, 30, 23, 37, 66, 58, 78, 79, 74)
)

# Tính trung bình và độ lệch chuẩn
data_summary <- data |> 
  dplyr::group_by(Mẫu) |> 
  dplyr::summarize(Trung_binh = mean(Số_tế_bào), SD = sd(Số_tế_bào), .groups = "drop")

# Vẽ biểu đồ với thanh sai số
ggplot(data_summary, aes(x = Mẫu, y = Trung_binh)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), fill = c("#1f77b4", "#ff7f0e"), color = "black") +
  geom_errorbar(aes(ymin = Trung_binh - SD, ymax = Trung_binh + SD),
                width = 0.2, position = position_dodge(0.9)) +
  labs(title = "Biểu đồ mật độ tế bào trong mẫu canh trường R và S", y = "Số lượng tế bào")
