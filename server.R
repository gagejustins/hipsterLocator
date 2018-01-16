library(choroplethr)
library(choroplethrMaps)
library(ggplot2)
library(ggthemes)
library(RColorBrewer)

electric <- read.csv("electric_cleaned.csv")
population <- read.csv("population_cleaned.csv")
farmers <- read.csv("farmers_cleaned.csv")

# Define a server for the Shiny app
function(input, output) {
  
  #Convert inputs to datasets
  datasetInput <- reactive({
    switch(input$data,
           "Population" = population,
           "Electric Cars" = electric,
           "Farmers Markets" = farmers)
  })
  
  colorScale <- reactive({
    switch(input$data,
           "Population" = "Blues",
           "Electric Cars" = "Greens",
           "Farmers Markets" = "Reds")
  })
  
  # Fill in the spot we created for a plot
  output$main_plot <- renderPlot({
    
    # Render a choropleth map
    choro1 <- CountyChoropleth$new(datasetInput())
    choro1$set_zoom("new york")
    choro1$set_num_colors(1)
    choro1$ggplot_polygon <- geom_polygon(aes(fill= value), color=NA)
    choro1$ggplot_scale <- scale_fill_gradientn(name = input$data, colours = brewer.pal(8, colorScale()), na.value = "White")
    choro1$render()
    
  })
}
  
  
  
  