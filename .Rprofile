##
## Load a package. If not available, install it
##
## @param  string  The library name
##
## @return
##
loadPKG <- function( pkgName, alsoLoad = TRUE ) {
    if ( pkgName %in% rownames( installed.packages() ) == FALSE ) {
        install.packages( pkgName )
    }

    if ( alsoLoad ) {
        library( pkgName, character.only = TRUE )
    }
}

local({
  r <- getOption("repos")
  r["CRAN"] <- "https://lib.ugent.be/CRAN/"
  options(repos = r)
})

# install.packages("shiny")
# install.packages("lintr") # sudo pacman -S gcc-fortran
