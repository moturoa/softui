
.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "shintologo",
    directoryPath = system.file(
      "logo",
      package = "softui"
    )
  )
  
  shiny::addResourcePath(
    prefix = "loadingscreen",
    directoryPath = system.file(
      "loadingscreen",
      package = "softui"
    )
  )
  
}

.onUnload <- function(libname, pkgname) {
  shiny::removeResourcePath("shintologo")
}

