# local packages for update
.rs.restartR()

# options(repos = c(CRAN = "https://cran.rstudio.com/"))
# options(repos = c(CRAN = "https://mirrors.nju.edu.cn/CRAN/"))




# # check supported R version
# supported_R_version <- supported_packages_pbi %>%
#   filter(Package == "base") %>%
#   select(Required_version) %>%
#   str_c()
# 
# # check local installed R vesion
# installed_R_version <- installed_packages %>%
#   filter(Package == "base") %>%
#   select(Version) %>%
#   str_c()


update_packages <- readRDS("update_packages.rds")
  

# sync version according to each row of the command


for (row in 1:nrow(update_packages)) {
  eval_command <- parse(text = update_packages$command[row])
  eval(eval_command)
}

# for (row in 1:nrow(update_packages)) {
#   install.packages(str_c("packrat/src/",update_packages$src_filename[row]), repos = NULL, type = "source")
# 
# }

