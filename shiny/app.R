### install packages

library(shiny)
packageVersion("shiny")

##### User Interface

ui <- fluidPage(
  "Hello word"
)



##### Server
server <- function(input,output,session){
  
}

#### run shiny application

shinyApp(ui,server)