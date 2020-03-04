library(shiny)
library(tidyverse)

ui <- fluidPage(radioButtons("colour", label = h3("Choose a colour"),
                             choices = list("Purple" = "purple",
                                            "Fire Brick Red" = "firebrick2",
                                            "Maroon" = "maroon4") ,
                             selected = "purple"),
                
                selectInput("classification", label = h3("Choose a movie classifcation"), 
                            choices = unique(movies$mpaa), 
                            selected = "PG"),
                
                sliderInput("year_slider", label = h3("Select a year range"), min = min(movies$year), 
                            max = max(movies$year), value = c(1990, 2000)),
                
                textInput("text", label = h3("Title"), value = "Enter text..."),
                
                plotOutput("scatterplot")
)

server <- function(input, output) {
  library(ggplot2)
  
  #Load the data
  data("movies", package = "ggplot2movies")
  
  # Create the scatter and save to output$
  output$scatterplot = renderPlot({
    movies %>%
      filter(length < 300) %>%
      filter(year > input$year_slider[1]) %>%
      filter(year < input$year_slider[2]) %>%
      filter(mpaa == input$classification) %>%
      ggplot(aes(x = length, y = rating)) + 
      geom_point(col = input$colour) +
      ggtitle(input$text)
  })
}

shinyApp(ui = ui, server = server)




