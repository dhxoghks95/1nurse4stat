library(tidyverse)


singer= read_csv("singertrend.csv")



singer = t(singer)
colnames(singer) <- singer[1,]
singer <- singer[-1,]
singer = as.data.frame(singer)

write.csv(singer, "singer.csv")
