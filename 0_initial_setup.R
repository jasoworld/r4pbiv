# setup R env for PowerBI
# according to https://learn.microsoft.com/en-us/power-bi/connect-data/service-r-packages-support

# set the repos to windows binary mirror temporarily
# options(repos = c(CRAN = "https://mran.microsoft.com/snapshot/2018-04-01", CRANextra = "http://www.stats.ox.ac.uk/pub/RWin"))
# options(repos = c(CRAN = "@CRAN@"))
# options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/windows/contrib"))
# options(repos = c(CRAN = "https://cran.rstudio.com/"))
options(repos = c(CRAN = "https://cran.r-project.org/"))


install.packages("renv", repos = "https://rstudio.r-universe.dev")

# remotes::install_github("rstudio/renv")

# install basic packages and update cacert.pem
# install.packages(c("packrat","openssl"), type = "binary")
# 
# 
# packrat::init()
# # 
# # 
# packrat::off()
# 
# # take snapshot
# packrat::snapshot(snapshot.sources = F)
# 
# 
# packrat::restore()
# 
# renv::migrate()
# 

# renv::deactivate()
# renv::init()
# renv::activate()
# renv::snapshot()
# renv::restore() 
renv::status() 
renv::activate()

