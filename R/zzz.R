.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "shintoui_assets",
    directoryPath = system.file(
      "assets",
      package = "shintoui"
    )
  )
}

.onUnload <- function(libname, pkgname) {
  shiny::removeResourcePath("assets")
}
