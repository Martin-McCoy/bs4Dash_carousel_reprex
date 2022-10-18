#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  shiny::tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bs4Dash::dashboardPage(
      header = mod_navbar_ui("navbar"),
      sidebar = mod_sidebar_ui("sidebar"),
      body = mod_body_ui("body"),
      footer = mod_footer_ui("footer"),
      dark = TRUE
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  golem::add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    golem::bundle_resources(
      path = app_sys('app/www'),
      app_title = 'bs4Dash_carousel_reprex'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

