#' Read application info (this_version or rsconnect deploy log)
#' @description Reads the content of  files "this_version.yml" and "shintoconnect_manifest.yml",
#' if they exist, and returns the contents as a list with components rsconnect and this_version.
#' Either of those is NULL if either of the files don't exist. 
#' @seealso \code{\link{appInfoModule}}, \code{\link{make_deploy_project}}
#' @export
#' @importFrom yaml read_yaml write_yaml
read_application_info <- function(read_git = TRUE){
  
  fn <- "shintoconnect_manifest.yml"
  if(file.exists(fn)){
    lis <- yaml::read_yaml("shintoconnect_manifest.yml")
  } else {
    lis <- NULL
  }
  
  tv <- "this_version.yml"
  if(file.exists(tv)){
    thisv <- yaml::read_yaml("this_version.yml")
  } else {
    thisv <- NULL
  }
  
  if(read_git){
    git <- read_git_version()  
  } else {
    git <- list(sha="",last_update="")
  }
  
  version <- get_application_version()
  
  list(rsconnect = lis, this_version = thisv, git = git, version = version)
  
}


