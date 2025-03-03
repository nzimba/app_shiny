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
  ## create a reactive expression
  
    dataset <- reactive({
      get(input$dataset, "package:datasets") 
    })
  output$summary <-renderPrint({
    ### use a reactive expression by calling it like a function
    summary(dataset())
  })
  output$table <-renderTable({
    dataset()
  })
}

#### run shiny application

shinyApp(ui,server)