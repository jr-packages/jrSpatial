#' Create a local copy of uk shape file
#'
#' This function will attempt to create a local copy of the uk shape file
#' such that you can make sure that you are happy with reading in data
#' from shape files
#'
#' @usage get_ukgeom()
#' @return logical TRUE if the operation was successful
#' @export
get_ukgeom = function(){
  fpath = system.file("ukgeom", package = "jrSpatial")
  if (! nchar(fpath)) {
    stop("Something wen't wrong, package internal csv file could not be found.
         You can skip this question if you want. Alternatively let me know and
         I will send you a copy manually")
  }
  if (!file.copy(from = fpath, to=getwd(),
                 recursive = TRUE,overwrite = TRUE)) {
    stop("Couldn't copy the file, you may not have permission to write to this
          directory. Try changing the working directory, either through the
          setwd() function or under Session in RStudio. If you still can't get
         it  working either skip this question or let me know and I will send
         you a copy manually.")
  }
  TRUE
}
