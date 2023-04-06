library(spotifyr)
library(tidyverse)
library(knitr)
library(rvest)

Sys.setenv(SPOTIFY_CLIENT_ID = '35668bf589b04ccb8732e204756b77da')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'd325c6c2a62d4f37b6bee1c6adba4118')

access_token <- get_spotify_access_token()

# collect hit music data by year 2022 - 1980

# process: 1) scrape song title & artist from wikipedia & write it to csv
# 2) get audio features from that playlist
# 3) remove unwanted columns & write it to csv
# 4) add billboard rank and year
# 5) combine both csv's together

# 2022
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2022")

TITLE <- url %>% html_nodes("td:nth-child(2)") %>% html_text
TITLE <- head(TITLE, - 5)

ARTIST <- url %>% html_nodes("td~ td+ td > a:nth-child(1)") %>% html_text

ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_2022 <- cbind(TITLE, ARTIST)

write.csv(year_2022, "2022.csv")

# get audio features
top_2022 <- get_playlist_audio_features(
  c("2022"),
  c("3xBeF2bX6RRt7HTxiQmgQj")
)

top_2022 <- top_2022[,-1:-5]
top_2022 <- select(top_2022, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2022,100)

top_2022 <- cbind(top_2022,billboard_year,billboard_rank,ARTIST)

write.csv(top_2022, "2022.csv")




# 2021
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2021")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td > a:nth-child(1)") %>% html_text

# merge into one
year_2021 <- cbind(RANK, TITLE, ARTIST, BILLBOARD_YEAR)

#write.csv(year_2021, "2021.csv")

# get audio features
top_2021 <- get_playlist_audio_features(
  c("2021 Billboard Year End Hot 100"),
  c("4XbUTUESZDcddgPuSaOlrT")
)

top_2021 <- top_2021[,-1:-5]
top_2021 <- select(top_2021, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2021,100)

top_2021 <- cbind(top_2021,billboard_year,billboard_rank,ARTIST)

write.csv(top_2021, "2021.csv")




# 2020
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2020")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td > a:nth-child(1)") %>% html_text

# merge into one
year_2020 <- cbind(TITLE, ARTIST)

#write.csv(year_2020, "2020.csv")

# get audio features
top_2020 <- get_playlist_audio_features(
  c("2020 Billboard Year End Hot 100"),
  c("2jDNKyd7Fs8Zf3pLVkCasY")
)

top_2020 <- top_2020[,-1:-5]
top_2020 <- select(top_2020, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2020,100)

top_2020 <- cbind(top_2020,billboard_year,billboard_rank,ARTIST)

write.csv(top_2020, "2020.csv")




# 2019
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2019")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2019 <- cbind(TITLE, ARTIST)

#write.csv(year_2019, "2019.csv")

# get audio features
top_2019 <- get_playlist_audio_features(
  c("2019 Billboard Year End Hot 100"),
  c("7tJ2JkOIYF2BTFGY3fumU0")
)

top_2019 <- top_2019[,-1:-5]
top_2019 <- select(top_2019, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2019,100)

top_2019 <- cbind(top_2019,billboard_year,billboard_rank,ARTIST)

write.csv(top_2019, "2019.csv")





# 2018
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2018")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2018 <- cbind(TITLE, ARTIST)

write.csv(year_2018, "2018.csv")

# get audio features
top_2018 <- get_playlist_audio_features(
  c("2018 Billboard Year End Hot 100"),
  c("4MCwbKJPbmfKY08aTyur9e")
)

top_2018 <- top_2018[,-1:-5]
top_2018 <- select(top_2018, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2018,100)

top_2018 <- cbind(top_2018,billboard_year,billboard_rank,ARTIST)

write.csv(top_2018, "2018.csv")





# 2017
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2017")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2017 <- cbind(TITLE, ARTIST)

write.csv(year_2017, "2017.csv")

# get audio features
top_2017 <- get_playlist_audio_features(
  c("2017"),
  c("4NssnFTfqJpIEFU2XUbos6")
)

top_2017 <- top_2017[,-1:-5]
top_2017 <- select(top_2017, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))
billboard_rank <- c(1:100)
billboard_year <- rep(2017,100)

top_2017 <- cbind(top_2017,billboard_year,billboard_rank,ARTIST)

write.csv(top_2017, "2017.csv")

# 2016
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2016")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td > a:nth-child(1)") %>% html_text

# merge into one
year_2016 <- cbind(TITLE, ARTIST)

write.csv(year_2016, "2016.csv")

# get audio features
top_2016 <- get_playlist_audio_features(
  c("2016"),
  c("2mdr2KUSbBCXTDaet1vEan")
)

top_2016 <- top_2016[,-1:-5]
top_2016 <- select(top_2016, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2016,100)

top_2016 <- cbind(top_2016,billboard_year,billboard_rank,ARTIST)

write.csv(top_2016, "2016.csv")

# 2015
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2015")

TITLE <- url %>% html_nodes("td:nth-child(2) a:nth-child(1)") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2015 <- cbind(TITLE, ARTIST)

write.csv(year_2015, "2015.csv")

# get audio features
top_2015 <- get_playlist_audio_features(
  c("2015"),
  c("4qYZaOjljmL14Wnxmuet5b")
)

top_2015 <- top_2015[,-1:-5]
top_2015 <- select(top_2015, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2015,100)

top_2015 <- cbind(top_2015,billboard_year,billboard_rank,ARTIST)

write.csv(top_2015, "2015.csv")

# 2014
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2014")

TITLE <- url %>% html_nodes("td:nth-child(2) a:nth-child(1)") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2014 <- cbind(TITLE, ARTIST)

write.csv(year_2014, "2014.csv")

# get audio features
top_2014 <- get_playlist_audio_features(
  c("2014"),
  c("1AepPCqnwDHAiEEm0juckm")
)

top_2014 <- top_2014[,-1:-5]
top_2014 <- select(top_2014, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2014,100)

top_2014 <- cbind(top_2014,billboard_year,billboard_rank,ARTIST)

write.csv(top_2014, "2014.csv")

# 2013
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2013")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)
TITLE <- tail(TITLE, -10)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2013 <- cbind(TITLE, ARTIST)

write.csv(year_2013, "2013.csv")

# get audio features
top_2013 <- get_playlist_audio_features(
  c("2013 Billboard Year End Hot 100"),
  c("1KK0RvFmgsUkZ8zELRZgjS")
)

top_2013 <- top_2013[,-1:-5]
top_2013 <- select(top_2013, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2013,100)

top_2013 <- cbind(top_2013,billboard_year,billboard_rank,ARTIST)

write.csv(top_2013, "2013.csv")



# 2012
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2012")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)
TITLE <- tail(TITLE, -10)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2012 <- cbind(TITLE, ARTIST)

write.csv(year_2012, "2012.csv")

# get audio features
top_2012 <- get_playlist_audio_features(
  c("2012"),
  c("7z7YGFVlofOs0A0mo5K9hS")
)

top_2012 <- top_2012[,-1:-5]
top_2012 <- select(top_2012, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2012,100)

top_2012 <- cbind(top_2012,billboard_year,billboard_rank,ARTIST)

write.csv(top_2012, "2012.csv")




# 2011
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2011")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2011 <- cbind(TITLE, ARTIST)

write.csv(year_2011, "2011.csv")

# get audio features
top_2011 <- get_playlist_audio_features(
  c("2011"),
  c("2z3eLip2NlV9quzTEm37cW")
)

top_2011 <- top_2011[,-1:-5]
top_2011 <- select(top_2011, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2011,100)

top_2011 <- cbind(top_2011,billboard_year,billboard_rank,ARTIST)

write.csv(top_2011, "2011.csv")





# 2010
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2010")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2010 <- cbind(TITLE, ARTIST)

write.csv(year_2010, "2010.csv")

# get audio features
top_2010 <- get_playlist_audio_features(
  c("2010 Billboard Year End Hot 100"),
  c("4aUY170nZ3mhkzMpTAXDv2")
)

top_2010 <- top_2010[,-1:-5]
top_2010 <- select(top_2010, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2010,100)

top_2010 <- cbind(top_2010,billboard_year,billboard_rank,ARTIST)

write.csv(top_2010, "2010.csv")






# 2009
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2009")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 222)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2009 <- cbind(TITLE, ARTIST)

# get audio features
top_2009 <- get_playlist_audio_features(
  c("2009 Billboard Year End Hot 100"),
  c("7FnOEoPb0biPkxYYAoXO8Q")
)

top_2009 <- top_2009[,-1:-5]
top_2009 <- select(top_2009, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2009,100)

top_2009 <- cbind(top_2009,billboard_year,billboard_rank,ARTIST)

write.csv(top_2009, "2009.csv")




# 2008
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2008")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 222)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2008 <- cbind(TITLE, ARTIST)

# write.csv(year_2008, "2008.csv")

# get audio features
top_2008 <- get_playlist_audio_features(
  c("2008 Billboard Year End Hot 100"),
  c("0S6g0tqZNT7xSdlNQzU2OQ")
)

top_2008 <- top_2008[,-1:-5]
top_2008 <- select(top_2008, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2008,100)

top_2008 <- cbind(top_2008,billboard_year,billboard_rank,ARTIST)

write.csv(top_2008, "2008.csv")







# 2007
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2007")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 222)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2007 <- cbind(TITLE, ARTIST)

#write.csv(year_2007, "2007.csv")

# get audio features
top_2007 <- get_playlist_audio_features(
  c("2007 Billboard Year End Hot 100"),
  c("0D8RVLZQJKbt1txw7fXCoA")
)

top_2007 <- top_2007[,-1:-5]
top_2007 <- select(top_2007, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2007,100)

top_2007 <- cbind(top_2007,billboard_year,billboard_rank,ARTIST)

write.csv(top_2007, "2007.csv")





# 2006
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2006")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2006 <- cbind(TITLE, ARTIST)

#write.csv(year_2006, "2006.csv")

# get audio features
top_2006 <- get_playlist_audio_features(
  c("2006 Billboard Year End Hot 100"),
  c("0NT0tq924n07BCDt9f5ZbL")
)

top_2006 <- top_2006[,-1:-5]
top_2006 <- select(top_2006, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2006,100)

top_2006 <- cbind(top_2006,billboard_year,billboard_rank,ARTIST)

write.csv(top_2006, "2006.csv")




# 2005
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2005")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2005 <- cbind(TITLE, ARTIST)

#write.csv(year_2005, "2005.csv")

# get audio features
top_2005 <- get_playlist_audio_features(
  c("2005 Billboard Year End Hot 100"),
  c("4olzlochc7bKxI9meYVBQ5")
)

top_2005 <- top_2005[,-1:-5]
top_2005 <- select(top_2005, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2005,100)

top_2005 <- cbind(top_2005,billboard_year,billboard_rank,ARTIST)

write.csv(top_2005, "2005.csv")




# 2004
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2004")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2004 <- cbind(TITLE, ARTIST)

#write.csv(year_2004, "2004.csv")

# get audio features
top_2004 <- get_playlist_audio_features(
  c("2004 Billboard Year End Hot 100"),
  c("4LDnL81lbN6ndYY86ApQAA")
)

top_2004 <- top_2004[,-1:-5]
top_2004 <- select(top_2004, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2004,100)

top_2004 <- cbind(top_2004,billboard_year,billboard_rank,ARTIST)

write.csv(top_2004, "2004.csv")



# 2003
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2003")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 76)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2003 <- cbind(TITLE, ARTIST)

#write.csv(year_2003, "2003.csv")

# get audio features
top_2003 <- get_playlist_audio_features(
  c("2003 Billboard Year End Hot 100"),
  c("1dyb3iCpfLYBQxdOjRuOme")
)

top_2003 <- top_2003[,-1:-5]
top_2003 <- select(top_2003, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2003,100)

top_2003 <- cbind(top_2003,billboard_year,billboard_rank,ARTIST)

write.csv(top_2003, "2003.csv")




# 2002
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2002")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 76)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2002 <- cbind(TITLE, ARTIST)

#write.csv(year_2003, "2003.csv")

# get audio features
top_2002 <- get_playlist_audio_features(
  c("2002 Billboard Year End Hot 100"),
  c("741Tpr4nbbPomeeNm26zhR")
)

top_2002 <- top_2002[,-1:-5]
top_2002 <- select(top_2002, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2002,100)

top_2002 <- cbind(top_2002,billboard_year,billboard_rank,ARTIST)

write.csv(top_2002, "2002.csv")




# 2001
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2001")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 76)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2001 <- cbind(TITLE, ARTIST)

#write.csv(year_2003, "2003.csv")

# get audio features
top_2001 <- get_playlist_audio_features(
  c("2001"),
  c("6ccYLbeG48proEZAg0SCRp")
)

top_2001 <- top_2001[,-1:-5]
top_2001 <- select(top_2001, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2001,100)

top_2001 <- cbind(top_2001,billboard_year,billboard_rank,ARTIST)

write.csv(top_2001, "2001.csv")





# 2000

url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_2000")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_2000 <- cbind(TITLE, ARTIST)

#write.csv(year_2003, "2003.csv")

# get audio features
top_2000 <- get_playlist_audio_features(
  c("2000 Billboard Year End Hot 100"),
  c("6oMuzOETMnkHjrApJIboQl")
)

top_2000 <- top_2000[,-1:-5]
top_2000 <- select(top_2000, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(2000,100)

top_2000 <- cbind(top_2000,billboard_year,billboard_rank,ARTIST)

write.csv(top_2000, "2000.csv")




# 1999

url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1999")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_1999 <- cbind(TITLE, ARTIST)

#write.csv(year_1999, "1999.csv")

# get audio features
top_1999 <- get_playlist_audio_features(
  c("1999 Billboard Year End Hot 100"),
  c("6T6MXJ0rx7iUWhIZFrYPzE")
)

top_1999 <- top_1999[,-1:-5]
top_1999 <- select(top_1999, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1999,100)

top_1999 <- cbind(top_1999,billboard_year,billboard_rank,ARTIST)

write.csv(top_1999, "1999.csv")





# 1998
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1998")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 76)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_1998 <- cbind(TITLE, ARTIST)

write.csv(year_1998, "1998.csv")

year_1998 <- read_csv("1998.csv")

# get audio features
top_1998 <- get_playlist_audio_features(
  c("1998 Billboard Year End Hot 100"),
  c("0LL3GeyKdYfqABU3HmwLkL")
)

top_1998 <- top_1998[,-1:-5]
top_1998 <- select(top_1998, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1998,100)

top_1998 <- cbind(top_1998,billboard_year,billboard_rank,ARTIST)

write.csv(top_1998, "1998.csv")




# 1997
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1997")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 81)

#ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1997 <- cbind(TITLE, ARTIST)

write.csv(year_1997, "1997.csv")

year_1997 <- read_csv("1997.csv")

# get audio features
top_1997 <- get_playlist_audio_features(
  c("1997 Billboard Year End Hot 100"),
  c("0QYWpb9gp3H7oexdeiEXDn")
)

top_1997 <- top_1997[,-1:-5]
top_1997 <- select(top_1997, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1997,100)

top_1997 <- cbind(top_1997,billboard_year,billboard_rank,ARTIST)

write.csv(top_1997, "1997.csv")






# 1996
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1996")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 81)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1996 <- cbind(TITLE, ARTIST)
write.csv(year_1996, "1996.csv")
year_1996 <- read_csv("1996.csv")

# get audio features
top_1996 <- get_playlist_audio_features(
  c("1996 Billboard Year End Hot 100"),
  c("6hPr6d6dFJyogVLY5O3SfC")
)

top_1996 <- top_1996[,-1:-5]
top_1996 <- select(top_1996, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1996,100)

top_1996 <- cbind(top_1996,billboard_year,billboard_rank,ARTIST)

write.csv(top_1996, "1996.csv")






# 1995
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1995")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1995 <- cbind(TITLE, ARTIST)
write.csv(year_1995, "1995.csv")
year_1995 <- read_csv("1995.csv")

# get audio features
top_1995 <- get_playlist_audio_features(
  c("1995 Billboard Year End Hot 100"),
  c("6kJzMeFN0mrD976eCsZafO")
)

top_1995 <- top_1995[,-1:-5]
top_1995 <- select(top_1995, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1995,100)

top_1995 <- cbind(top_1995,billboard_year,billboard_rank,ARTIST)

write.csv(top_1995, "1995.csv")





# 1994
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1994")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 78)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1994 <- cbind(TITLE, ARTIST)
write.csv(year_1994, "1994.csv")
year_1994 <- read_csv("1994.csv")

# get audio features
top_1994 <- get_playlist_audio_features(
  c("1994 Billboard Year End Hot 100"),
  c("7J7RuZ9zhXQmJIW1U73ZZP")
)

top_1994 <- top_1994[,-1:-5]
top_1994 <- select(top_1994, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1994,100)

top_1994 <- cbind(top_1994,billboard_year,billboard_rank,ARTIST)

write.csv(top_1994, "1994.csv")






# 1993
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1993")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 74)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1993 <- cbind(TITLE, ARTIST)
write.csv(year_1993, "1993.csv")
year_1993 <- read_csv("1993.csv")

# get audio features
top_1993 <- get_playlist_audio_features(
  c("1993 Billboard Year End Hot 100"),
  c("1cqjZdrSwDnPkUoFjxl93L")
)

top_1993 <- top_1993[,-1:-5]
top_1993 <- select(top_1993, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1993,100)

top_1993 <- cbind(top_1993,billboard_year,billboard_rank,ARTIST)

write.csv(top_1993, "1993.csv")






# 1992
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1992")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1992 <- cbind(TITLE, ARTIST)
write.csv(year_1992, "1992.csv")
year_1992 <- read_csv("1992.csv")

# get audio features
top_1992 <- get_playlist_audio_features(
  c("1992 Billboard Year End Hot 100"),
  c("1IeK2eQU5tzy2kAG9ripli")
)

top_1992 <- top_1992[,-1:-5]
top_1992 <- select(top_1992, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1992,100)

top_1992 <- cbind(top_1992,billboard_year,billboard_rank,ARTIST)

write.csv(top_1992, "1992.csv")





# 1991
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1991")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1991 <- cbind(TITLE, ARTIST)
write.csv(year_1991, "1991.csv")
year_1991 <- read_csv("1991.csv")

# get audio features
top_1991 <- get_playlist_audio_features(
  c("1991 Billboard Year End Hot 100"),
  c("54h4mXTd5GV8Vw6S9y1HdH")
)

top_1991 <- top_1991[,-1:-5]
top_1991 <- select(top_1991, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1991,100)

top_1991 <- cbind(top_1991,billboard_year,billboard_rank,ARTIST)

write.csv(top_1991, "1991.csv")






# 1990
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1990")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 74)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1990 <- cbind(TITLE, ARTIST)
write.csv(year_1990, "1990.csv")
year_1990 <- read_csv("1990.csv")
view(top_1990)
# get audio features
top_1990 <- get_playlist_audio_features(
  c("1990 Billboard Year End Hot 100"),
  c("6eMnDaB4Ghdlg13VpEWfDd")
)

top_1990 <- top_1990[,-1:-5]
top_1990 <- select(top_1990, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1990,100)

top_1990 <- cbind(top_1990,billboard_year,billboard_rank,ARTIST)

write.csv(top_1990, "1990.csv")






# 1989
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1989")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1989 <- cbind(TITLE, ARTIST)
#write.csv(year_1989, "1989.csv")
#year_1989 <- read_csv("1989.csv")

# get audio features
top_1989 <- get_playlist_audio_features(
  c("1989 Billboard Year End Hot 100"),
  c("2gEGSj4yRtyxCCiDOXpgD6")
)

top_1989 <- top_1989[,-1:-5]
top_1989 <- select(top_1989, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1989,100)

top_1989 <- cbind(top_1989,billboard_year,billboard_rank,ARTIST)

write.csv(top_1989, "1989.csv")





# 1988
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1988")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1988 <- cbind(TITLE, ARTIST)
write.csv(year_1988, "1988.csv")
year_1988 <- read_csv("1988.csv")
view(top_1988)
# get audio features
top_1988 <- get_playlist_audio_features(
  c("1988 Billboard Year End Hot 100"),
  c("0LOMRi9CJAwVDUR8VqacBM")
)

top_1988 <- top_1988[,-1:-5]
top_1988 <- select(top_1988, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1988,100)

top_1988 <- cbind(top_1988,billboard_year,billboard_rank,ARTIST)

write.csv(top_1988, "1988.csv")






# 1987
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1987")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_1987 <- cbind(TITLE, ARTIST)

# get audio features
top_1987 <- get_playlist_audio_features(
  c("1987 Billboard Year End Hot 100"),
  c("3iqzGtKQfNJxryHkHT3vnG")
)

top_1987 <- top_1987[,-1:-5]
top_1987 <- select(top_1987, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1987,100)

top_1987 <- cbind(top_1987,billboard_year,billboard_rank,ARTIST)

write.csv(top_1987, "1987.csv")






# 1986
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1986")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 222)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one
year_1986 <- cbind(TITLE, ARTIST)

# get audio features
top_1986 <- get_playlist_audio_features(
  c("1986 Billboard Year End Hot 100"),
  c("5y4xtrXvgw6RN6P5EdOAC6")
)

top_1986 <- top_1986[,-1:-5]
top_1986 <- select(top_1986, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1986,100)

top_1986 <- cbind(top_1986,billboard_year,billboard_rank,ARTIST)

write.csv(top_1986, "1986.csv")






# 1985
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1985")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 222)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(ARTIST, "ARTIST.csv")
ARTIST <- read_csv("ARTIST.csv")

# merge into one
year_1985 <- cbind(TITLE, ARTIST)

# get audio features
top_1985 <- get_playlist_audio_features(
  c("1985 Billboard Year End Hot 100"),
  c("5fBadau85jUFCeS8LnLSRi")
)

top_1985 <- top_1985[,-1:-5]
top_1985 <- select(top_1985, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1985,100)

top_1985 <- cbind(top_1985,billboard_year,billboard_rank,ARTIST)

write.csv(top_1985, "1985.csv")






# 1984
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1984")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 221)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1984 <- cbind(TITLE, ARTIST)

# get audio features
top_1984 <- get_playlist_audio_features(
  c("1984 Billboard Year End Hot 100"),
  c("3l2n0l6FzaMOapPipN8bz2")
)

top_1984 <- top_1984[,-1:-5]
top_1984 <- select(top_1984, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1984,100)

top_1984 <- cbind(top_1984,billboard_year,billboard_rank,ARTIST)

write.csv(top_1984, "1984.csv")






# 1983
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1983")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1983 <- cbind(TITLE, ARTIST)

# get audio features
top_1983 <- get_playlist_audio_features(
  c("1983 Billboard Year End Hot 100"),
  c("4umHBuy3JDtC91gMtNSZwc")
)

top_1983 <- top_1983[,-1:-5]
top_1983 <- select(top_1983, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1983,100)

top_1983 <- cbind(top_1983,billboard_year,billboard_rank,ARTIST)

write.csv(top_1983, "1983.csv")






# 1982
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1982")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 77)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

# merge into one

# get audio features
top_1982 <- get_playlist_audio_features(
  c("1982 Billboard Year End Hot 100"),
  c("27Vlwble86hmWegpAh3Slv")
)

top_1982 <- top_1982[,-1:-5]
top_1982 <- select(top_1982, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1982,100)

top_1982 <- cbind(top_1982,billboard_year,billboard_rank,ARTIST)

write.csv(top_1982, "1982.csv")






# 1981
url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1981")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# merge into one
year_1981 <- cbind(TITLE, ARTIST)

# get audio features
top_1981 <- get_playlist_audio_features(
  c("1981 Billboard Year End Hot 100"),
  c("7327jpiCK2ft1vAoSB7srg")
)

top_1981 <- top_1981[,-1:-5]
top_1981 <- select(top_1981, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1981,100)

top_1981 <- cbind(top_1981,billboard_year,billboard_rank,ARTIST)

write.csv(top_1981, "1981.csv")






# 1980

url <- read_html("https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_1980")

TITLE <- url %>% html_nodes("td:nth-child(2) a") %>% html_text
TITLE <- head(TITLE, - 75)

ARTIST <- url %>% html_nodes("td~ td+ td a:nth-child(1)") %>% html_text

write.csv(TITLE, "TITLE.csv")
TITLE <- read_csv("TITLE.csv")

# get audio features
top_1980 <- get_playlist_audio_features(
  c("1980 Billboard Year End Hot 100"),
  c("3FbGahNbtlGkRAS0bm9hsD")
)

top_1980 <- top_1980[,-1:-5]
top_1980 <- select(top_1980, -c(analysis_url, added_at, is_local, primary_color,
                                added_by.href, added_by.id,added_by.type, added_by.uri,
                                added_by.external_urls.spotify, track.artists, track.available_markets,
                                track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))

billboard_rank <- c(1:100)
billboard_year <- rep(1980,100)

top_1980 <- cbind(top_1980,billboard_year,billboard_rank,ARTIST)

write.csv(top_1980, "1980.csv")

# "non hits"

# read in playlist
other_songs <- get_playlist_audio_features(
  c("longest playlist ever"),
  c("1eyCGLyX077Uo880SwgyAB")
)

other_songs <- other_songs[,-1:-5]
other_songs <- select(other_songs, -c(analysis_url, added_at, is_local, primary_color,
                                      added_by.href, added_by.id,added_by.type, added_by.uri,
                                      added_by.external_urls.spotify, track.available_markets,
                                      track.disc_number, track.episode, track.href, track.is_local, track.preview_url,
                                      track.track, track.type, track.uri, track.album.artists, track.album.available_markets,
                                      track.album.href,track.album.id, track.album.images,track.album.release_date_precision,
                                      track.album.total_tracks,track.album.type,track.album.uri,track.album.external_urls.spotify,
                                      track.external_ids.isrc, track.external_urls.spotify,video_thumbnail.url ))


# combine both
all_songs <- rbind(top_songs, other_songs)
write.csv(all_songs, "all_songs.csv")
