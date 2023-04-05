library(tidyverse)

supported_pkg_pbi <- readRDS("supported_pkg_pbi.rds") %>%
  rename(Required_version = Version) %>%
  select(Package, Required_version) %>%
  mutate(src_filename = str_c(Package,"/",Package,"_",Required_version,".tar.gz")) %>%
  mutate(downloadlink = str_c("https://cran.r-project.org/src/contrib/Archive/", src_filename))


# get local installed packages
installed_packages <- as.data.frame(installed.packages(), stringsAsFactors = F)[,c("Package", "Version")]
rownames(installed_packages) <- NULL


local_src_pkg <- tibble(src_filename = list.files("packrat/src", pattern = "[.]gz$", full.names = F, recursive = T))


# build up command string for evaluation
update_packages <- installed_packages %>%
  left_join(supported_pkg_pbi) %>%
  filter(!is.na(Required_version)) %>%
  filter(Version != Required_version) %>%
  # mutate(to_update = if_else(Version == Required_version,0,1)) %>%
  # filter(to_update == 1) %>%
  mutate(command = str_c("renv::install('",Package,"@", Required_version,"')")) %>%
  # mutate(command = str_c("remotes::install_version(\"", command, "\", upgrade = \"never\")")) %>%
  write_rds("update_packages.rds")

download_src_pkg <- update_packages %>%
  anti_join(local_src_pkg)

installed_packages_not_support <- installed_packages %>%
  anti_join(supported_pkg_pbi)


# for (row in 1:nrow(download_src_pkg)) {
#   dir.create(str_c("./packrat/src/",download_src_pkg$Package[row]))
#   curl::curl_download(download_src_pkg$downloadlink[row], str_c("./packrat/src/",download_src_pkg$src_filename[row]))
# }
