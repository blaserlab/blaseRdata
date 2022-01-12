# # package setup
# library(usethis)
# create_package("/workspace/workspace_pipelines/blaseRdata")
# use_mit_license("Brad Blaser")
# use_readme_md()
# use_news_md()
# use_git()
# use_github()
# use_data_raw()

# check()
document()
# commit and push
#install
renv::install("blaserlab/blaseRdata", library = "/usr/lib/R/site-library")
