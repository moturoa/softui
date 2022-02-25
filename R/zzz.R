
.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "shintologo",
    directoryPath = system.file(
      "logo",
      package = "softui"
    )
  )
}

.onUnload <- function(libname, pkgname) {
  shiny::removeResourcePath("shintologo")
}

