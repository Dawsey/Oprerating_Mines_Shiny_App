#
# This app was prepared for the "Developing Data Products" Coursera assignment
# November 2019
#

data.mines <- read.csv("Data/Operating_Mines.csv", stringsAsFactors = FALSE)

sub_type <- c(names(summary(as.factor(data.mines$SUB_TYPE))))
com_group <- c(names(summary(as.factor(data.mines$COMMODITY_GROUP_NAME))))
target <- c(names(summary(as.factor(data.mines$TARGET_GROUP_NAME))))
stage <- c(names(summary(as.factor(data.mines$STAGE))))

pal <- colorFactor(topo.colors(length(sub_type)), domain = sub_type)
pal.com_group <- colorFactor(topo.colors(length(com_group)), domain = com_group)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$com.grp.names <- renderUI({
        selectInput("commodity.group", "Select Commodity Group", choices = c("all", as.character(com_group)), selected = "all")
    })
    
    output$com.names <- renderUI({
        selectInput("target.group", "Select Target Group", choices = c("all", as.character(target)), selected = "all")
    })
    
    output$op.status.name <- renderUI({
        selectInput("op.status", "Select Operating Status", choices = c("all", as.character(stage)), selected = "all")
    })
    
    output$pit.type.name <- renderUI({
        selectInput("pit.type", "Select Mine Pit Type", choices = c("all", as.character(sub_type)), selected = "all")
    })
    

    output$mymap <- renderLeaflet({
        
        # Subet by Pit Type
        if (input$pit.type == "all") {
            
        } else {
            data.mines <- data.mines %>%
                filter(SUB_TYPE == input$pit.type)
        }
        
        # Subet by target group
        if (input$op.status == "all") {
            
        } else {
            data.mines <- data.mines %>%
                filter(STAGE == input$op.status)
        }
        

        # Subet by commodity group
        if (input$commodity.group == "all") {
            
        } else {
            data.mines <- data.mines %>%
                filter(COMMODITY_GROUP_NAME == input$commodity.group)
        }
        
        # Subet by target group
        if (input$target.group == "all") {
            
        } else {
            data.mines <- data.mines %>%
                filter(TARGET_GROUP_NAME == input$target.group)
        }
        
        # Output the number of records to check
        output$text <- renderText({
            paste("Number of Mines in Search is:", nrow(data.mines))
        })
        
        data.mines %>% 
            leaflet() %>% addTiles() %>% addCircleMarkers( 
                lat = ~ LATITUDE, 
                lng = ~ LONGITUDE,
                fill = TRUE,
                color = ~ pal.com_group(COMMODITY_GROUP_NAME),
                popup = ~ paste("<h3>", SHORT_TITLE, "</h3> ",
                                "<b>Project:</b>", PROJECT_TITLE, "<br>",
                                "<b>Stage:</b>", STAGE, "<br>",
                                "<b>Type:</b>", SUB_TYPE, "<br>",
                                "<b>Commodity Group:</b>", COMMODITY_GROUP_NAME, "<br>",
                                "<b>Commodity:</b>", TARGET_GROUP_NAME, "<br>"),
                clusterOptions = markerClusterOptions())
    })
    
    
    
})
