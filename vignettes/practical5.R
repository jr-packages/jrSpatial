## ----include = FALSE----------------------------------------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE, warning = FALSE, message = FALSE)

## ---- message = FALSE, warning = FALSE----------------------------------------
library("sf")
library("leaflet")
library("dplyr")
data(meth, package = "jrSpatial")

## -----------------------------------------------------------------------------
head(meth)

## ---- fig.keep="none", eval = FALSE-------------------------------------------
#  leaflet(meth) %>%
#    addTiles() %>%
#    addCircles(data = meth)

## ---- fig.keep="none", eval = FALSE-------------------------------------------
#  leaflet(meth) %>%
#    addTiles() %>%
#    addCircles(data = meth,
#               radius = ~pounds_seized)
#  # radius of circles is bigger if more pounds of meth were seized

## ---- fig.keep="none", eval = FALSE-------------------------------------------
#  pal_size = colorNumeric(palette = c("green", "red"),
#                          domain = meth$pounds_seized)
#  
#  leaflet(meth) %>%
#    addTiles() %>%
#    addCircles(data = meth,
#               radius = ~pounds_seized,
#               color = ~pal_size(pounds_seized))

## ---- echo = TRUE, results="show", eval = FALSE-------------------------------
#  library("ggplot2")
#  ggplot(meth, aes(x = pounds_seized)) +
#    geom_histogram()

## ---- echo = TRUE, eval = FALSE-----------------------------------------------
#  pal_size_bin = colorBin(palette = c("Green", "Yellow", "Orange", "Red"),
#                          domain = meth$pounds_seized,
#                          bins = c(0, 150, 300, 750, max(meth$pounds_seized)))

## -----------------------------------------------------------------------------
# green - from 0 -150
# yellow - from 150 - 300
# orange - from 300 - 750
# red - from 750 - max value in pounds_seized

## ---- fig.keep="none", eval = FALSE-------------------------------------------
#  leaflet(meth) %>%
#    addTiles() %>%
#    addCircles(data = meth,
#               radius = ~pounds_seized,
#               color = ~pal_size_bin(pounds_seized))

## ---- fig.keep="none", eval = FALSE-------------------------------------------
#  leaflet(meth) %>%
#    addTiles() %>%
#    addCircles(data = meth,
#               radius = ~pounds_seized,
#               color = ~pal_size_bin(pounds_seized)) %>%
#    addLegend(title = "Pounds seized",
#              pal = pal_size_bin,
#              values = ~pounds_seized)

## ---- eval= FALSE, echo = TRUE------------------------------------------------
#  vignette("solutions5", package = "jrSpatial")

