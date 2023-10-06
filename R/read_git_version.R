#' Read most recent git SHA for the current working directory
#' @details Returns a list with components 'sha' (the first 6 chars of the most recent
#' git commit SHA) and the date of last update. If the command fails (for example, this is
#' not a git repos), it returns "unknown" for both.
#' @export
#' @importFrom gert git_log git_branch git_remote_list
read_git_version <- function(){
  
  r <- requireNamespace("gert")
  
  if(!r){
    return(list(
      sha = "",
      last_update = ""
    ))
  }
  
  gitlog <- try(gert::git_log(max = 1), silent = TRUE)
  
  if(inherits(gitlog, "try-error")){
    
    git_version <- list(sha = "unknown", last_update = "unknown")
    
  } else {
    branch <- gert::git_branch()
    remote <- gert::git_remote_list()$url[1]
    
    git_version <- list(
      sha = substr(gitlog$commit, 1, 6),
      last_update = format(gitlog$time, "%Y-%m-%d"),
      branch = branch,
      remote = remote
    )
    
  }
  
  return(git_version)
}



