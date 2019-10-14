library(shiny)

envport <- Sys.getenv("PORT")

if (envport!="") {
  # this is required for heroku deployment. it appears that they coerce the port on their end
  envportasint <- as.integer(envport)
  runApp("app/", port=envportasint, host = getOption("shiny.host", "0.0.0.0"))
} else {
  runApp("app/", port=3838, host = getOption("shiny.host", "0.0.0.0"))
}