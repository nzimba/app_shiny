### install packages

library(shiny)
packageVersion("shiny")

##### User Interface

ui <- fluidPage(
  # selectInput("dataset", label = "Dataset", choices= ls("package:datasets")),
  # verbatimTextOutput("summary"),
  # tableOutput("table")
  # numericInput("age","How old are you?", value=NA),
  # textInput("name","What's your name?"),
  # textOutput("gretting"),
  # tableOutput("mortgage")
  
  sliderInput("x", label = "if x is", min =1, max = 50, value = 30), 
  "then x time 5 is", textOutput("product")
  )


##### Server
server <- function(input,output,session){
  
  output$product <- renderText({
    product <- input$x * 5
  })
  
  # output$gretting <- renderText({
  #   paste0("Hello ", input$name)
  # })
  # 
  # output$histogram <- renderPlot({
  #   hist(rnorm(1000),res=96, input$age)
  # })
  
  # ## create a reactive expression
  # 
  #   dataset <- reactive({
  #     get(input$dataset, "package:datasets") 
  #   })
  # output$summary <-renderPrint({
  #   ### use a reactive expression by calling it like a function
  #   summary(dataset())
  # })
  # output$table <-renderTable({
  #   dataset()
  # })
}

#### run shiny application

shinyApp(ui,server)