#' body_welcome UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_body_welcome_ui <- function(id){
  ns <- shiny::NS(id)
  shiny::tagList(
    uiOutput(
      ns("body")
    )
  )
}
run_once <- TRUE
#' body_welcome Server Functions
#'
#' @noRd

mod_body_welcome_server <- function(id){
  shiny::moduleServer( id, function(input, output, session){

    ns <- session$ns





  observe({
    req(run_once)
    assignInNamespace("run_once", FALSE, pkgload::pkg_desc()$get("Package"))

    shiny::showModal(
      shiny::modalDialog(
        id = "splash",
        uiOutput("carousel_content"),
        easyClose = TRUE,
        size = "xl",
        footer = NULL
        )
      )

  })



   output$carousel_content <- renderUI({

     bs4Dash::carousel(
       id = "intro_carousel",
       width = 12,
       bs4Dash::carouselItem(tagList(
         h2(class = "d-flex justify-content-center", "Slide 1")
       )),
       bs4Dash::carouselItem(tagList(tags$h2("Slide 2"))),
       bs4Dash::carouselItem(htmltools::withTags(
         div(class = "d-flex justify-content-center",
             h3("Slide 3"))
       ))
     )
   })


  })
}

## To be copied in the UI
# mod_body_welcome_ui("body_welcome_1")

## To be copied in the server
# mod_body_welcome_server("body_welcome_1")
