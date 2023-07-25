#' Insert `|>`
#'
#' Inserts [`|>`][base::|>] at the cursor position.
#'
#' @export
insertBuiltinPipe <- function() {
    glyph <- "|>"
    rstudioapi::insertText(ifelse(nextToSpace(), glyph, prefixSpace(glyph)))
}
