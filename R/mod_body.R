#' body UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd

#' @importFrom shiny NS tagList

mod_body_ui <- function(id){
  ns <- shiny::NS(id)
  bs4Dash::dashboardBody(
    shiny::uiOutput(ns("bodyui"))
  )
}

#' body Server Functions
#'
#' @noRd
mod_body_server <- function(id){
  shiny::moduleServer( id, function(input, output, session){

    ns <- session$ns

    # Mead Elevations
    e <- environment()


      # All DB dependent logic goes here
    output$bodyui <- shiny::renderUI({
      shiny::req(active$ui)
      if (exists(active$server))
        get0(active$server, envir = rlang::ns_env("bs4Dash_carousel_reprex"))(id = paste0("body_", active$tab))
      # Render the body UIs here
      if (exists(active$ui))
        get0(active$ui, envir = rlang::ns_env("bs4Dash_carousel_reprex"))(id = ns(paste0("body_", active$tab)))
    })




  })
}

## To be copied in the UI
# mod_body_ui("body_1")

## To be copied in the server
# mod_body_server("body_1")
