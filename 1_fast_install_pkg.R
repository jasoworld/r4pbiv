# options(repos = c(CRAN = "https://mran.microsoft.com/snapshot/2018-04-01"))
options(repos = c(CRAN = "https://cran.r-project.org/"))

# install basic packages and update cacert.pem
# install.packages(c("openssl"),  type = "binary")


# install support packages
install.packages(c("tidyverse"),  type = "binary")
# install.packages(c("remotes"),  type = "source")

# install common packages
install.packages(c("plotly", "janitor"), type = "binary")
# install.packages(c("pillar","rlang","vctrs"), type = "source")



# remotes::install_version("rlang", "0.4.1", upgrade = "never")
# remotes::install_version("lifecycle", "0.1.0", upgrade = "never")
# remotes::install_version("vctrs", "0.2.0", upgrade = "never")
# remotes::install_version("dplyr", "0.8.3", upgrade = "never")
# 
# remotes::install_version("tidyr", "1.0.0", upgrade = "never")
# remotes::install_version("knitr", "1.20", upgrade = "never")
