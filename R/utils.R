#' Generic utility functions
#'
#' Generic utility functions usually not to be used outside the package
#' environment.
#'
#' @keywords internal
#' @name utility_functions
NULL

#' Check if console if currently focused.
#'
#' @return logical
consoleFocused <- function() {
    rstudioapi::getActiveDocumentContext()$id == "#console"
}

#' @section Check space:
#' Check if last character is an empty space.
#'
#' @rdname utility_functions
nextToSpace <- function() {
    if (consoleFocused()) {
        return(FALSE)
    }
    # FIXME: not passing right T/F value
    # Source context information and position
    current_context <- rstudioapi::getSourceEditorContext()
    end_row <-
        as.integer(unlist(current_context$selection)["range.end.row"])
    end_col <-
        as.integer(unlist(current_context$selection)["range.end.column"])
    # Get last character
    last_character <-
        substr(
            current_context$contents[end_row],
            end_col - 1,
            end_col - 1
        )

    # Return T/F depending on empty space being last character
    return(grepl("^\\s+$", last_character))
}

#' @section Surround character with empty space
prefixSpace <- function(x) {
    paste0(" ", x)
}
