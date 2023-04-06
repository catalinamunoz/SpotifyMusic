library(tidyverse)

# read in data
songs <- read_csv("data-raw/all_songs.csv")

# change data types
songs$explicit <- as.factor(songs$explicit)
songs$Hit <- as.factor(songs$Hit)
songs$key_mode<- as.factor(songs$key_mode)
songs$mode_name <- as.factor(songs$mode_name)
songs$key_name <- as.factor(songs$key_name)
songs$duration_min <- as.double(songs$duration_min)
songs$danceability <- as.double(songs$danceability)
songs$energy <- as.double(songs$energy)
songs$loudness <- as.double(songs$loudness)
songs$speechiness<-as.double(songs$speechiness)
songs$acousticness <- as.double(songs$acousticness)
songs$instrumentalness <- as.double(songs$instrumentalness)

# remove duplicates based on track id
songs <- songs[!duplicated(songs$track.id), ]

# change duration columns to minutes
songs$duration_ms <- (songs$duration_ms) / 60000

# rename duration and artist column
songs <- rename(songs, duration_min = duration_ms)
songs <- rename(songs, artist = ARTIST)

# reorder columns
songs <- songs[, c(10, 14, 16, 15, 22, 21, 20, 23, 1, 2, 3, 4, 5, 6, 7,
                   8, 9, 11, 13, 17, 18, 19, 12)]

# put non-hits for year & rank = 0
songs$billboard_year[songs$billboard_year == '0'] <- "non-hit"
songs$billboard_rank[songs$billboard_rank == '0'] <- "non-hit"

# change to factors
songs$billboard_rank <- as.factor(songs$billboard_rank)
songs$billboard_year <- as.factor(songs$billboard_year)

# remove track.album.name
songs <- subset(songs, select = -c(track.album.name))

# save data to data directory
usethis::use_data(songs, overwrite = TRUE)
