golem::fill_desc(
  pkg_name = "covidashboard",
  pkg_title = "PKG_TITLE",
  pkg_description = "PKG_DESC.",
  author_first_name = "AUTHOR_FIRST",
  author_last_name = "AUTHOR_LAST",
  author_email = "AUTHOR@MAIL.COM",
  repo_url = NULL
)     
golem::set_golem_options()
usethis::use_mit_license( "Golem User" )
usethis::use_readme_rmd( open = FALSE )
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )
usethis::use_news_md( open = FALSE )
usethis::use_git()
golem::use_recommended_tests()
golem::use_recommended_deps()
golem::use_favicon()
golem::remove_favicon()
golem::use_utils_ui()
golem::use_utils_server()
rstudioapi::navigateToFile( "dev/02_dev.R" )
