  library(lubridate)
  library(leaflet)
  library(dplyr)
  
  # Data taken from DMIRS
  # https://dasc.dmp.wa.gov.au/DASC?productAlias=MINEDEXOperatingMines
  
  data.mines <- read.csv("./Data/Operating_Mines.csv", stringsAsFactors = FALSE)
  
  sub_type <- c(names(summary(as.factor(data.mines$SUB_TYPE))))
  com_group <- c(names(summary(as.factor(data.mines$COMMODITY_GROUP_NAME))))
  
  pal <- colorFactor(topo.colors(length(sub_type)), domain = sub_type)
  pal.com_group <- colorFactor(topo.colors(length(com_group)), domain = com_group)
  # mypal <- colorNumeric(topo.colors(length(sub_type)), domain = data.mines$SUB_TYPE, na.color = "Black")
  # wardpal <- colorFactor(topo.colors(length(sub_type)), domain = data.mines$SUB_TYPE)
  
  leaflet(data = data.mines) %>% addTiles() %>% addCircleMarkers( 
                                                lat = ~ LATITUDE, 
                                                lng = ~ LONGITUDE,
                                                fill = TRUE,
                                                color = ~ pal.com_group(COMMODITY_GROUP_NAME),
                                                popup = ~ paste("Name:", SHORT_TITLE, "<br>",
                                                                "Project:", PROJECT_TITLE, "<br>",
                                                                "Stage:", STAGE, "<br>",
                                                                "Type:", SUB_TYPE, "<br>",
                                                                "Commodity Group:", COMMODITY_GROUP_NAME, "<br>",
                                                                "Commodity:", TARGET_GROUP_NAME, "<br>")) # %>%
  
  
  
  data.mines %>% 
    filter(COMMODITY_GROUP_NAME == "Alumina") %>%
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
  
  