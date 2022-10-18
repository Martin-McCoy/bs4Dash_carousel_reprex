#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Inputs needed in submodules
  active <<- shiny::reactiveValues(splash = TRUE)

  shiny::observe({
    active$ui <- paste0("mod_body_", input$active_tab, "_ui")
    active$server <-  paste0("mod_body_", input$active_tab, "_server")
    active$tab <- input$active_tab
  })
  observeEvent(input$dark_mode, {
    active$dark_mode <- input$dark_mode
  }, priority = 3)
  # Top-level Modules
  mod_navbar_server("navbar")
  mod_sidebar_server("sidebar")
  mod_body_server("body")
}
