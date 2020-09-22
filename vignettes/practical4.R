## ----include = FALSE----------------------------------------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE, warning = FALSE, message = FALSE)

## ----load libraries, echo = TRUE, message = FALSE, warning = FALSE------------
library("sf")
library("dplyr")
library("tmap")
library("jrSpatial")

## ----create lon lat-----------------------------------------------------------
loc = data.frame(lon = -1.6053, lat = 54.9705)

## ----sf convert, echo = TRUE--------------------------------------------------
loc = st_as_sf(loc, coords = c("lon", "lat"))

## ----longlat check------------------------------------------------------------
st_is_longlat(loc)
st_crs(loc)
# no longlat because we have not set the coordinate ref system yet

## ----set crs longlat check----------------------------------------------------
loc = st_set_crs(loc, 4236)
st_is_longlat(loc)

## ----nz, fig.keep= 'none'-----------------------------------------------------
data(nz_missing, package = "jrSpatial")
tm_shape(nz_missing) + tm_borders() + tm_fill()

# Part of New Zealand is missing.

## ---- echo = TRUE-------------------------------------------------------------
data(canterbury, package = "jrSpatial")

## ---- echo = TRUE, eval = FALSE-----------------------------------------------
#  rbind(x, y)

## ----cant bind, eval = FALSE--------------------------------------------------
#  nz = rbind(nz, canterbury)
#  # The two data sets have different CRS. R won't let us combine them.

## ----transform, fig.keep= 'none'----------------------------------------------
st_crs(nz_missing)
canterbury = st_transform(canterbury, 4326)

nz = rbind(nz_missing, canterbury)

tm_shape(nz) + tm_borders() + tm_fill()

## ---- eval= FALSE, echo = TRUE------------------------------------------------
#  vignette("solutions4", package = "jrSpatial")
