## ----include = FALSE----------------------------------------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE, warning = FALSE, message = FALSE)

## ---- echo = TRUE, message = FALSE, warning = FALSE---------------------------
library("sf")
library("jrSpatial")

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  get_ukgeom()

## ---- eval = FALSE------------------------------------------------------------
#  ukgeom = st_read("ukgeom/ukgeom.shp")

## ---- echo = FALSE------------------------------------------------------------
data(ukgeom, package = "jrSpatial")

## ---- fig.keep = "none"-------------------------------------------------------
plot(ukgeom)

## ---- fig.keep='none'---------------------------------------------------------
plot(ukgeom[, c("pop_2015", "pop_2017")])

## ---- fig.keep="none", echo = TRUE--------------------------------------------
p = st_point(c(13, 15))
plot(p)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
ps = rbind(c(10, 10), c(10, 9), c(11, 9), c(11, 10))
mp = st_multipoint(ps)
plot(mp)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
l = st_linestring(mp)
plot(l)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
ps2 = rbind(c(11, 11), c(12, 11))
mls = st_multilinestring(list(ps, ps2))
plot(mls)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
pol_points = rbind(c(10, 10), c(10, 9), c(11, 9), c(11, 10), c(10, 10))
pol = st_polygon(list(pol_points))
plot(pol)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
pol_points2 = rbind(c(12, 12), c(13, 13), c(14, 12), c(12, 12))
mpol = st_multipolygon(list(list(pol_points), list(pol_points2)))
plot(mpol)

## ---- fig.keep="none", echo = TRUE--------------------------------------------
gc = st_geometrycollection(list(p, mpol, mls))
plot(gc)

## ---- fig.keep='none', echo = TRUE--------------------------------------------
longitude = c(-61, -63, -65, -66, -66)
latitude = c(26, 27, 28, 29, 30)
shary_matrix = cbind(longitude, latitude)

## ---- fig.keep = "none"-------------------------------------------------------
shary = st_linestring(shary_matrix)
plot(shary)

## -----------------------------------------------------------------------------
longitude2 = c(-64, -61, -57)
latitude2 = c(31, 33, 35)
shary_matrix2 = cbind(longitude2, latitude2)
shary = st_multilinestring(list(shary_matrix, shary_matrix2))

## ---- echo = TRUE-------------------------------------------------------------
longitude = c(-65, -66, -67, -67, -66)
latitude = c(23, 24, 25, 26, 27)
colin_matrix = cbind(longitude, latitude)
colin = st_linestring(colin_matrix)

## ---- echo = TRUE-------------------------------------------------------------
hurricane = st_sf(name = c("Shary", "Colin"),
                  geometry = st_sfc(shary, colin))

## ---- eval= FALSE, echo = TRUE------------------------------------------------
#  vignette("solutions1", package = "jrSpatial")
