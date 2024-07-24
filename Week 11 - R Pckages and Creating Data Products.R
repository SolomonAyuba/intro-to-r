# WEEK 11: R Packages and Creating Data Products
## Tue 23 July 2024

# The description file inside R can be accessed with the command 
# packageDescription("package_name") and the documentation using 
# help(package = "package_name"):

packageDescription("tidyverse")
help(package ="dplyr")

# INSTALL R PACKAGES FROM CRAN
# ● Multiple R packages can be installed at the same time, by passing character 
# as a vector as an argument to install.packages():

install.packages(c("readr", "ggplot2"))

# R packages are installed in a directory called library. The R function 
# .libPaths() can be used to get the path to the library.
.libPaths("readr")


# INSTALL FROM CRAN MIRRORS
# The list of available mirrors can be view using getCRANmirrors() function or 
# directly on the CRAN mirrors page.
# ● To use Imperial College London’s mirror (UK):
getCRANmirrors()
intall.packages("tidyverse", repo = "https:// cran.imperial.ac.uk/")

# INSTALL FROM BIOCONDUCTOR
# ● Bioconductor contains packages for analyzing biological related data.
# ● The current way of installing a Bioconductor package is by:
if(!require("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install()
  
  # The above will install some core packages of Bioconductor.
  # ● Available packages in Bioconductor can be viewed using:
BiocManager::available()

# Specific packages like “aws” and “aws.alexa” can be installed:
install(c("aws", "aws.alxa"))

## INSTALL VIA DEVTOOLS  
# The R package devtools was developed by Hadley Wickham and can be installed 
#  using:
install.packages("devtools")
  
 # After devtools is installed, utility functions to install other packages 
# can then be used. The options are:
  
install_cran() #from CRAN
install.bioc() #from Bioconductor
install.git() #from a git repositoy
install_github() # from GitHub

#UPDATE, REMOVE AND CHECK INSTALLED PACKAGES
# To check what packages are installed on the computer:
installed.packages()

# Uninstalling a package is straightforward:
remove.packages("packageName")

#UPDATE, REMOVE AND CHECK INSTALLED PACKAGES
# You can check what packages that need an update using:
old.packages()

#  You can update all packages and a specific package using:
update.packages()
update.packages("packageName")

# LOAD AND ACCESS INSTALLED PACKAGES

# After a package is installed, its functionalities are ready to use.
# ● For the use of a few functions or data inside a package, one can
# directly access the package without loading it into the system.
# ● This can be done with the notation packagename::functionname():
#   ● For example, since we have installed the nycflights13 package, one of 
# its datasets flights can be explored using:

nycflights13::flights

# LOAD AND ACCESS INSTALLED PACKAGES
#● An overview of what functions and data are contained in a package can be
# view using the help() function:
  
help(package = ("nycflights13"))

# LOAD AND ACCESS INSTALLED PACKAGES
# ● An overview of what functions and data are contained in a package can be 
# view using the help() function:

help(package = "nycflights13")
  
# For more intensive use of a package, best is to load it into system. 
# This can be done using the library() function.
# ● The library() makes it possible to write the name of the package
# without quotes:
library(nycflights13)
flights

# LOAD AND UNLOAD INSTALLED PACKAGES
# ● After load a package, can directly access its functionalities like any 
# other R base functions or data.
# ● To view the list of loaded packages in the current R session, 
# use the function search():
  search()

  # When done with the package, it can be unload it using detach():
  detach("package:nycflights13", unload=TRUE)  
  search()  

  install.packages('pryr')
  library(pryr)  
  ftype()  

# Interactive Learning -
# Introduction to Shiny for Creating Interactive Data Products
  # In this example, we create a UI with a title panel, 
  # a sidebar panel containing a text input widget, and a main panel 
  # displaying text output. This UI defines the app's appearance.
  
  install.packages("shiny")
  library(shiny)
  
  ui <- fluidPage(
    
    titlePanel("Simple Shiny App"),  # Display the app title
    
    sidebarLayout(
      
      sidebarPanel(
        
        # Input widget - text input
        
        textInput("name", "Enter your name:")  # Prompt user to enter their name
        
      ),
      
      mainPanel(
        
        # Output widget - text display
        
        textOutput("greeting")  # Display the greeting message
        
      )
      
    )
    
  )
  
  # The server logic is where you define how your Shiny app behaves.
  # It responds to user input, processes data, and updates the UI accordingly. 
  
  server <- function(input, output) {
    
    # Reactive expression to generate a greeting message
    
    output$greeting <- renderText({
      
      paste("Hello,", input$name, "!")
      
    })
    
  }
  
  ## Reactive Programming
  
  # Reactive programming is a core concept in Shiny. It allows you to 
  # create dynamic and responsive apps by defining relationships between 
  # inputs and outputs. Here's an example demonstrating reactivity:
  
  
  # Define a numeric input field
  numericInput("num", "Enter a number:", value = 5)
  
  # Reactive expression to compute the square of the input
  squared <- reactive({
    input$num^2
  })
  
  # Display the result of the square calculation
  output$square_result <- renderText({
    paste("The square of", input$num, "is", squared())
  })
  
  ## Dynamic UI Updates
  # 
  # Shiny allows you to dynamically update the UI based on user interactions. 
  # Here's an example of dynamically showing/hiding a UI element
  
  # Checkbox for toggling the visibility of an element
  checkboxInput("show_element", "Show Element", value = FALSE)
  
  # UI element to be displayed or hidden based on checkbox state
  conditionalPanel(
    condition = "input.show_element == true",
    textOutput("hidden_text")
  )
  
  ## Let's explore some real-world case studies where Shiny has been used to 
  ## create impactful data products.
  
  ## Case Study: Interactive Dashboard for Financial Analysis
  # In this simplified example, Shiny is used to create an 
  # interactive financial dashboard for data analysis and visualisation.
  # The actual code for a financial dashboard may involve data loading, 
  # complex calculations, and interactive plot creation.
  
  # Load required libraries
  library(shiny)
  library(shinydashboard)
  
  # Create a financial dashboard
  ui <- dashboardPage(
    dashboardHeader(title = "Financial Dashboard"),
    dashboardSidebar(
      # Include sidebar content and controls
    ),
    dashboardBody(
      # Include body content, interactive plots, and data tables
    )
  )
  
  # Define server logic
  server <- function(input, output) {
    # Server code for data analysis and visualisation
  }
  
  # Create a Shiny app object
  shinyApp(ui = ui, server = server)
  
  ## Case Study: Healthcare Data Visualisation
  # In this example, Shiny is used to create an interactive healthcare data 
  # visualisation tool. Users can select specific data parameters, and 
  # the server logic generates customised ggplot2 visualisations 
  # based on their selections.
  
  # Load required libraries
  library(shiny)
  library(ggplot2)
  
  # Create Shiny app UI
  ui <- fluidPage(
    titlePanel("Healthcare Data Visualisation"),
    sidebarLayout(
      sidebarPanel(
        # Input controls for selecting data
        # Add input controls here
      ),
      mainPanel(
        # Interactive ggplot2 visualisations
        plotOutput("healthcare_plot")
      )
    )
  )
  
  # Define server logic
  server <- function(input, output) {
    # Server code for data preprocessing and visualisation
    output$healthcare_plot <- renderPlot({
      # Create and customise ggplot2 plots based on user input
      # Add ggplot code here
    })
  }
  
  # Create a Shiny app object
  shinyApp(ui = ui, server = server)

  ## Find Week 12 on Week 12.R script.