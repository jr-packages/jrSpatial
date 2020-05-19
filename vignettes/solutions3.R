## ----include = FALSE----------------------------------------------------------
library(tufte)
# knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ----load libraries, echo = TRUE, message = FALSE, warning = FALSE------------
library("sf")
library("tmap")
library("jrSpatial")

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  data(ukgeom, package = "jrSpatial")

## ---- popdensity, echo = FALSE, fig.keep = 'none', warning = FALSE------------
library("dplyr")
ukgeom = 
ukgeom  %>%
  mutate(pop_den_2017 = pop_2017 / area)

  # Bonus
tm_shape(ukgeom) +
  tm_borders() +
  tm_fill("pop_den_2017") + 
  tm_layout(legend.outside = TRUE)

## ---- eval = FALSE, echo = TRUE-----------------------------------------------
#  data(ukdata, package = "jrSpatial")

## ----left_join----------------------------------------------------------------
library("tidyr")
ukgeomfull = left_join(ukgeom, ukdata, by = c("id" = "geo"))
class(ukgeomfull)
# The output is still recognised as an sf spatial dataframe.

ukgeomfull_reverse = left_join(ukdata, ukgeom, by = c("geo" = "id"))
class(ukgeomfull_reverse)
# Notice this output is recognised as a data frame, but not as being an sf data frame.
# This means that functions like tmap() will not work. 

## ----q3-----------------------------------------------------------------------
ukgeomfull %>%
  filter(pop_2017 > 2500000) 

ukgeomfull %>%
  filter(income < 15000 | unemployment > 5) 

## ----q6-----------------------------------------------------------------------
ukgeomfull %>%
  st_drop_geometry() %>%
  group_by(country) %>%
    summarise(total_pop = sum(pop_2017),
              avg_life = round(mean(lifeExp)))

## ---- eval=FALSE, echo = TRUE-------------------------------------------------
#  data(ukhills, package = "jrSpatial")

## ----marilyns data, warning = FALSE-------------------------------------------
hills_uk = st_join(ukhills, ukgeom)

## ----marilyns, fig.keep = 'none'----------------------------------------------
tm_shape(hills_uk) + tm_dots() +
  tm_shape(ukgeom) + tm_borders()

## ----Ireland NA---------------------------------------------------------------
# There are number of Marilyns in the dataset which are located in Ireland. 
# Ireland is not included in the ukgeom data, and therefore st_join() sets the 
# region as NA for these hills.

## ----highest marilyn by region------------------------------------------------
hills_uk %>%
  st_drop_geometry() %>%
  filter(region == "Cumbria") %>%
  arrange(desc(Metres)) %>%
  slice(1:3)

## ----marilyns by region, warning = FALSE--------------------------------------
hills_uk %>%
  st_drop_geometry() %>%
  group_by(region) %>%
  summarise(total = n()) %>%
  arrange(desc(total)) %>%
  slice(1)

