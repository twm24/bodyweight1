
Young <- Weight_Change %>%
  filter(TSB != 0) %>%
  filter(Age < 66)
View(Young)

Old <- Weight_Change %>%
  filter(TSB != 0) %>%
  filter(Age > 65)
View(Old)


ggplot(data = Young, mapping = aes(x = TSB, y = Avg.Change)) +
  geom_point() +
  labs(title = "Avg Change",
       x = "Time Since Baseline (yrs)", y = "Average Weight Change (kg/yr)")

colnames(SES_Sex)[1] = "id"
colnames(SES_Sex)[2] = "sexm1"
colnames(Young)[1] = "id"
colnames(Old)[1] = "id"
colnames(Weight_Change)[1] = "id"


Young1 = merge(x=Young,y=SES_Sex,by="id",all.x=TRUE)
View(Young1)

Old1 = merge(x=Old,y=SES_Sex,by="id",all.x=TRUE)
View(Old1)

ggplot(data = Young1, mapping = aes(x = TSB, y = Avg.Change, color = SES)) +
  geom_point() +
  labs(title = "Avg Change",
       x = "Time Since Baseline (yrs)", y = "Average Weight Change (kg/yr)")

