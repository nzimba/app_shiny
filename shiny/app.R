### install packages

library(shiny)
packageVersion("shiny")

##### User Interface

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices= ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)



##### Server
server <- function(input,output,session){
  output$summary <-renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  output$table <-renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
  
}

#### run shiny application

shinyApp(ui,server)