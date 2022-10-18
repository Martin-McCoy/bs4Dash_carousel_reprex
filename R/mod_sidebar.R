#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd

#' @importFrom shiny NS tagList



mod_sidebar_ui <- function(id){
  ns <- shiny::NS(id)
  bs4Dash::dashboardSidebar(
    collapsed = FALSE,
    bs4Dash::bs4SidebarMenu(
      id = "active_tab",
      compact = TRUE,
      bs4Dash::bs4SidebarMenuItem(
        "Welcome",
        tabName = "welcome"
      )
    )
  )
}




 #' sidebar Server Functions
#'
#' @noRd
mod_sidebar_server <- function(id){
  shiny::moduleServer( id, function(input, output, session){

    ns <- session$ns


  })
}
