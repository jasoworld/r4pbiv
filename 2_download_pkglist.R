# local packages for update
library(tidyverse)
library(rvest)
library(httr)


# get supported packages for pbi visiual
set_config(user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0"))

supported_packages_pbi <- "https://github.com/MicrosoftDocs/powerbi-docs/blob/main/powerbi-docs/connect-data/service-r-packages-support.md" %>%
  read_html() %>%
  html_node(".markdown-body > table:nth-child(12)") %>%
  html_table() %>%
  write_rds("supported_pkg_pbi.rds") 

