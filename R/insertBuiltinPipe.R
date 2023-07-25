#' Insert `|>`
#'
#' Inserts [`|>`][base::|>] at the cursor position.
#'
#' @export
insertBuiltinPipe <- function() {
    glyph <- "|>"
    if (consoleFocused()) {
        glyph <- paste0(glyph, " ")
    }
    rstudioapi::insertText(ifelse(nextToSpace(), glyph, prefixSpace(glyph)))
    if (!consoleFocused()) {
        rstudioapi::insertText("\n")
    }
}
