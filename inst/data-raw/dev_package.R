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

# add, commit, push
gert::git_add("*")
gert::git_commit("version 0.0.0.9008")
gert::git_push()

# build and insert into repo
pkg_build <- devtools::build()

drat::insertPackage(file = pkg_build,
                    repodir = "/home/OSUMC.EDU/blas02/network/X/Labs/Blaser/share/data/R/drat/",
                    action = "archive")

unlink(pkg_build)
