#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot Random Numbers"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("npoints", "How Many Random Numbers Should we Plot?", value = 1000,
                         min = 1, max = 10000, step = 100),
            sliderInput("sliderXavg", "Select the mean value for Y", -10, 10, value = 0),
            sliderInput("sliderXsd", "Select standard deviation value for Y", 0, 10, value = 1),
            sliderInput("sliderY", "Select X's degrees of freedom", 0, 100, value = 25),
            sliderInput("sliderXaxis", "Select maximum and minimum values for the X axis", 0, 200, value = c(10,50)),
            sliderInput("sliderYaxis", "Select maximum and minimum values for the Y axis", -50, 50, value = c(-10,10)),
            sliderInput("sliderAlpha", "Select points' transparency", 0, 1, value = .7),
            checkboxInput("show_xlab", "Show/Hide X Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title", value = FALSE)
        )
        ,

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Plot",plotOutput('plot1')),
                tabPanel('Documentation',includeHTML('Documentation.html')),
                tabPanel('Repo',includeHTML('link_to_repo.html'))
            )
        )
    )
)
)
