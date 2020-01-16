OPERATING MINES IN WESTERN AUSTRALIA
========================================================
author: Nick  
date: 14 December 2019
autosize: true

INTRODUCTION
========================================================

This submission forms the final assignment of the Developing Data Products Coursera Module.

The assignment requires the development of Shiny App that is reactive to a user's inputs. The WA Operating Mines application shows the locations of operating mines within Western Australia using the `leaflet` package combined with `shiny`.

The data was obtained from the Department of Mines, Industry Regulation and Safety.

The source of the data is https://dasc.dmp.wa.gov.au/DASC?productAlias=MINEDEXOperatingMines.

ABOUT THE DATA
========================================================




The data contains 33 variables with 1144 observations.

A sample of the data is provided below:

```r
head(data.mines[, 1:4])
```

```
  SITE_CODE  SHORT_TITLE                        TITLE SITE_TYPE
1  S0000012      Baneygo                      Baneygo      Mine
2  S0000033  Big Bell UG         Big Bell Underground      Mine
3  S0000045      Aladdin             Aladdin Open Pit      Mine
4  S0000062    Brittania       Brittania - Mt Hampton      Mine
5  S0000198 Yarlarweelor   Yarlarweelor North & South      Mine
6  S0000357      Jupiter Jupiter - Joanne - Doublejay      Mine
```

All of the data is publically available under a Creative Commons License.

THE SHINY APP
========================================================

The app is available at https://datality.shinyapps.io/WA_Operating_Mines/.

This app presents a full page Leaflet map centred on Western Australia. The cluster function was used to present a cleaner, less cluttered view.

An introduction is provided in the app to assist first time users.

All of the data is loaded by default.

Details of the four drop-down menus are provided on the next slide.


THE SHINY APP (CONTINUED)
========================================================
### 1 - Operating Status

   This selects wheter the mine is operational or underdevelopment.
   
### 2 - Mine Pit Type

   There are various mine pit types such as "Openpit", "Adit" etc.

### 3 - Commodity Group

   There are broad commidity groupings. This allows the user to select these.

### 4 - Target Group

   This drills down into the target commodity for each mine such as "Iron Ore", "Gold" etc.


