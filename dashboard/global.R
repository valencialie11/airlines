library(shiny)
library(shinydashboard)
library(plotly)
library(tidyverse)
library(ggrepel)
library(lubridate)
library(DT)
library(leaflet)
library(readxl)
library(readr)
library(shinyjs)
library(dplyr)
library(DBI)
library(RSQLite)

db <- dbConnect(RSQLite::SQLite(), dbname = "database.db")




get_audio_tag <- function(filename) {
  tags$audio(src = filename,
             type = "audio/mp3",
             controls = "controls")
}


