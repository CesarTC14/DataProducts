#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot1 <- renderPlot({
        set.seed(1234)
        number_of_points <- input$npoints
        avgX <- input$sliderXavg
        sdX <-  input$sliderXsd
        # minY <- input$sliderY[1]
        # maxY <- input$sliderY[2]
        dfX <- input$sliderY
        dataX <- rchisq(number_of_points, dfX)
        # dataX <- runif(number_of_points, minY, maxY)
        dataY <- rnorm(number_of_points, avgX, sdX)
        # xlab <- ifelse(input$show_xlab, "Uniform", "")
        xlab <- ifelse(input$show_xlab, "Chi-Squared", "")
        ylab <- ifelse(input$show_ylab, "Normal", "")
        main <- ifelse(input$show_title, "Chi-Squared x Normal Plot", "")

        df <- as.data.frame(cbind(x = dataX,
                                  y = dataY))

        bl_pal <- colorRampPalette(c('blue', 'green', 'white'))

        gg <- ggplot(df, aes(x = dataX, y = dataY)) +
            geom_point(col = alpha(bl_pal(24)[3], 1-input$sliderAlpha)) +
            xlim(c(input$sliderXaxis[1],input$sliderXaxis[2])) +
            ylim(c(input$sliderYaxis[1],input$sliderYaxis[2])) +
            labs(title = main,
                 x = xlab,
                 y = ylab)


        gg

        # plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main, type = 'o',
        #      col = rgb(0,100,255, maxColorValue = 255),
        #      xlim = c(-100, 100), ylim = c(-25, 25))

        # df %>%
        #     plot_ly() %>%
        #     add_trace(x = ~x,
        #               y = ~y,
        #               type = 'scatter',
        #               mode = 'markers',
        #               marker = list(size = 10,
        #                             color = 'rgba(0,100,255,.3')) %>%
        #     layout(xaxis = list(title = xlab),
        #            yaxis = list(title = ylab)
        #     )
    })

    })
