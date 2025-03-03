### install packages

library(shiny)
library(ggplot2)
packageVersion("shiny")

datasets <- c("economics", "faithfuld", "seals")


##### User Interface

ui <- fluidPage(
  # selectInput("dataset", label = "Dataset", choices= ls("package:datasets")),
  # verbatimTextOutput("summary"),
  # tableOutput("table")
  # numericInput("age","How old are you?", value=NA),
  # textInput("name","What's your name?"),
  # textOutput("gretting"),
  # tableOutput("mortgage")
  
  # sliderInput("x", label = "if x is", min =1, max = 50, value = 30),
  # sliderInput("y", label = "if x is", min = 1, max = 50, value = 5),
  # "then, (x * y) is ", textOutput("product"),
  # "and, (x * y) + 5 is ", textOutput("product_plus5"),
  # "and, (x * y) + 10 is", textOutput("product_plus10")
  
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
  
  )


##### Server
server <- function(input,output,session){
  
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset())
  }, res=96)
  # output$product <- renderText({
  #   product <- input$x * input$y
  # })
  # 
  # output$product_plus5 <- renderText({
  #   product_plus5 <- (input$x * input$y)
  #   product_plus5+5
  # })
  # 
  # output$product_plus10 <- renderText({
  #   product_plus10 <- (input$x * input$y)
  #   product_plus10+10
  # })
  
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