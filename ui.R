# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Elements of a Hipster State"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("data", "Dataset:", 
                  choices=c("Population", "Electric Cars", "Farmers Markets")),
      hr(),
      helpText("Data from NYC Open Data Project. Thanks to Julia Silge for the general idea and choroplethR syntax.")
    ),
    
    # Create a spot for the choropleth map
    mainPanel(
      plotOutput("main_plot")  
    )
    
  )
)