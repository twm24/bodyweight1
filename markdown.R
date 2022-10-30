
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

ggplot(data = Young2, mapping = aes(x = TSB, y = Avg.Change, color = SES)) +
  geom_point() +
  labs(title = "Avg Change",
       x = "Time Since Baseline (yrs)", y = "Average Weight Change (kg/yr)")

Young2 <- Young1 %>%
  mutate(sexm1 = case_when(
    sexm1 == 1       ~ "male",
    sexm1 == 2       ~ "female")) %>%
  mutate(SES = case_when(
    SES == 1 ~ "Low",
    SES == 2 ~ "LowMid",
    SES == 3 ~ "MidHigh",
    SES == 4 ~ "High"))
view(Young2)



ggplot(data = Young2, mapping = aes(x = Age, y = Avg.Change, color = SES)) +
  facet_grid(SES ~ sexm1) +
  geom_point() +
  ylim(-1, 1) +
  geom_smooth(method=lm, se=FALSE, col='black')
  labs(title = "Avg Change",
       x = "Age (yrs)", y = "Average Weight Change (kg/yr)")

