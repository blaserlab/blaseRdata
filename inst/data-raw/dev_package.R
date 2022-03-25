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
devtools::document()

# add, commit, push
gert::git_add("*")
gert::git_commit("version 0.0.0.9009")
gert::git_push()

# build and insert into repo
blaseRtemplates::dratify(repo_name = "blaserX", repo_dir = "~/network/X/Labs/Blaser/share/data/R/drat")
