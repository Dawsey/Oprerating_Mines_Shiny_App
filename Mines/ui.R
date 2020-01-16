
library(shiny)
library(leaflet)
library(dplyr)

ui <- bootstrapPage(
  
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  titlePanel("Operating Mines in Western Australia"),
  leafletOutput("mymap", width = "100%", height = "100%"), #leafletOutput("mymap",  width = "100%")
  absolutePanel(top = 100, right = 10, fixed = TRUE,
                #HTML('<button data-toggle="collapse" data-target="#demo">Collapsible</button>'),
                h3("Introduction"),
                hr(),
                p("This tool shows Operating Mines in WA. Use the drop "),
                p("down boxes below to filter the data based on criteria."),
                p("The reactive textbox shows number of mines matching the"),
                p("search critera."),
                p(),
                "The code for this app is available on my",
                tags$a(href="https://github.com/Dawsey/Oprerating_Mines_Shiny_App", " Github page."),
                p(),
                h3("Filters"),
                uiOutput("op.status.name"),
                uiOutput("pit.type.name"),
                uiOutput("com.grp.names"),
                uiOutput("com.names"),
                h4(textOutput("text"))#)
                )
              )
