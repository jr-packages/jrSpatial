## ----include = FALSE----------------------------------------------------------
library(tufte)
# knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ---- message = FALSE, echo = TRUE--------------------------------------------
library("tmap")
library("jrSpatial")

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  data("ukgeom", package = "jrSpatial")

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) +
  tm_fill() +
  tm_borders()

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) + 
  tm_fill(col = "pop_2017") +
  tm_borders()

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) +
  tm_fill(col = "pop_2017") +
  tm_borders() +
  tm_layout(legend.position = c("left", "top"))
# or
# tm_layout(legend.outside = TRUE)

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) +
  tm_fill(col = "pop_2017",
          title = "UK population 2017") +
  tm_borders() +
  tm_layout(legend.position = c("left", "top"))

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) +
  tm_fill(col = c("pop_2015", "pop_2015"),
          palette = "PuRd") +
  tm_borders()

## ---- fig.keep='none', message = FALSE----------------------------------------
tm_shape(ukgeom) +
  tm_fill(col = c("pop_2015", "pop_2017")) +
  tm_borders()
# no major difference

## ---- echo = TRUE, fig.keep='none', message = FALSE---------------------------
library("dplyr")
ukgeom = mutate(ukgeom, areapps = area / pop_2017 * 1000)
# * 1000 to change units from km^2 to m^2
tm_shape(ukgeom) + 
  tm_layout(legend.position = c("left", "top")) +
  tm_fill("areapps",
          title = "Area per person") +
  tm_borders()

## ---- echo = TRUE, fig.keep='none'--------------------------------------------
tm_shape(ukgeom) +
  tm_layout(legend.position = c("left", "top")) +
  tm_fill("areapps", 
          title = "Area per person",
          breaks = c(seq(0, 20, 4), 100)) +
  tm_borders()

## ---- echo = TRUE-------------------------------------------------------------
data("ukhills_big", package = "jrSpatial")

## ---- echo = TRUE, fig.keep='none'--------------------------------------------
tm_shape(ukgeom) + 
  tm_fill() + 
  tm_borders() + 
tm_shape(ukhills_big) + 
  tm_bubbles()

## ---- fig.keep='none', warning = FALSE----------------------------------------
tm_shape(ukgeom) + 
  tm_fill() + 
  tm_borders() + 
tm_shape(ukhills_big) + 
  tm_bubbles(col = "Metres", 
             size = 0.5)

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  tmap_mode("view")

## ---- fig.keep='none', warning = FALSE----------------------------------------
tm_shape(ukgeom) + 
  tm_fill(id = "region") + 
  tm_borders() + 
tm_shape(ukhills_big) + 
  tm_bubbles(col = "Metres", 
             size = 0.1, 
             id = "Mountain") 

