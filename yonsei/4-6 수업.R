manifesto_url <- "http://www.manifesto.or.kr/manifesto_data/20200210/2020/2020_251.zip"
install.packages("webshot2")
library(webshot2)
webshot2::webshot("http://manifesto.or.kr/manifesto_data/20200210/2020na_map.htm", "fig/manifesto_2020.png")

library(tidyverse)
library(rvest)
install.packages("janitor")
library(janitor)

Sys.setlocale("LC_ALL", "C") #인코딩 기계로 바꾸고

manifest_html <- read_html("http://www.manifesto.or.kr/manifesto_data/20200210/20na/01.html")

manifest_tbl <- manifest_html %>% 
  html_nodes("table") %>% 
  html_table(fill=TRUE) %>% 
  .[[1]]

Sys.setlocale("LC_ALL", "Korean") # 다시 한국어로 인코딩

manifest_df <- manifest_tbl %>% 
  janitor::clean_names() %>% 
  tbl_df %>% 
  set_names(manifest_tbl[1,]) %>% 
  slice(2:n())

manifest_df %>% 
  DT::datatable()
