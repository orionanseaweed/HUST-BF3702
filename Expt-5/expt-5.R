library(ggplot2)
library(tidyverse)

# tạo data frame từ số liệu thực nghiệm
data <- data.frame(
  fov = c("1", "2", "3"),         # fov stands for microscope field of view 
  sum_cell = c(726, 734, 718),
  budding_cell = c(38, 42, 32)
)

# tính trung bình và độ lệch chuẩn
means <- colMeans(data[, -1])
sds <- apply(data[, -1], 2, sd)

# tạo data frame cho biểu đồ
plot_data <- data.frame(
  Nhom = names(means),
  Trung_binh = means,
  SD = sds
)

# vẽ biểu đồ với thanh sai số
ggplot(plot_data, aes(x = Nhom, y = Trung_binh)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), fill = c("#1f77b4", "#ff7f0e"), color = "black") +
  geom_errorbar(aes(ymin = Trung_binh - SD, ymax = Trung_binh + SD),
                width = 0.2, position = position_dodge(0.9)) +
  labs(title = "Biểu đồ tổng số tế bào và số tế bào nảy chồi trong canh trường R", y = "Số lượng", x = "") +
  theme_minimal()
