library(SpotifyMusic)
library(cowplot)
library(tidyverse)

# numerical variables
p4<-ggplot(songs, aes(y=energy)) + geom_boxplot(aes(color=Hit), show.legend = FALSE)+
  ggtitle("Numerical Elements of Hit vs Non-Hit Songs") +
  theme(plot.title = element_text(face="bold",size = 10))

p9<-ggplot(songs, aes(y=track.popularity)) + geom_boxplot(aes(color=Hit))

p2<-ggplot(songs, aes(y=danceability)) + geom_boxplot(aes(color=Hit), show.legend = FALSE)+
  ggtitle(" ")

p1<-ggplot(songs, aes(y=loudness)) + geom_boxplot(aes(color=Hit), show.legend = FALSE)+
  ggtitle(" ")

p6<-ggplot(songs, aes(y=valence)) + geom_boxplot(aes(color=Hit), show.legend = FALSE )

# transformations
p10 <- ggplot(songs, aes(y=log(instrumentalness))) + geom_boxplot(aes(color=Hit), show.legend = FALSE) +
  ggtitle("Numerical Elements of Hit vs Non-Hit Songs") +
  theme(plot.title = element_text(face="bold",size = 10))

p3<-ggplot(songs, aes(y=log(tempo))) + geom_boxplot(aes(color=Hit), show.legend = FALSE)+
  ggtitle(" ")

p5<-ggplot(songs, aes(y=log(liveness))) + geom_boxplot(aes(color=Hit), show.legend = FALSE)+
  ggtitle(" ")

p7<-ggplot(songs, aes(y=log(duration_min))) + geom_boxplot(aes(color=Hit), show.legend = FALSE)

p8<-ggplot(songs, aes(y=log(acousticness))) + geom_boxplot(aes(color=Hit), show.legend = FALSE)

p11 <- ggplot(songs, aes(y=log(speechiness))) + geom_boxplot(aes(color=Hit))

# cowplot one
plot_1 <- plot_grid(p4,p2,p1,p6, p9)
caption_1 <- add_sub(plot_1,
                     "Data distribtion comparison of song features for 'hit' and 'non-hit' songs. Popular songs seem to have a higher danceability and lower valence score.",
                     size = 11)
ggdraw(caption_1)

# cowplot two
plot_2 <- plot_grid(p10,p5,p3,p7,p8, p11)
caption_2 <- add_sub(plot_2, "Data distribtion comparison of song features for 'hit' and 'non-hit' songs.",size=12)
caption_2 <- add_sub(caption_2, "Popular songs seem to be longer and have lower instrumentalness, liveness, and speechiness values.",
                     size=12)
ggdraw(caption_2)

# categorical variables

# keymode percentages
keymode_hit <- songs %>%
  group_by(key_mode) %>%
  mutate(d = n()) %>%
  group_by(key_mode, Hit) %>%
  summarise(Perc = n()/first(d)*100, .groups = "drop") %>%
  pivot_wider(
    id_cols = key_mode,
    names_from = Hit,
    values_from = Perc)

# key name percentages
keyname_hit <- songs %>%
  group_by(key_name) %>%
  mutate(d = n()) %>%
  group_by(key_name, Hit) %>%
  summarise(Perc = n()/first(d)*100, .groups = "drop") %>%
  pivot_wider(
    id_cols = key_name,
    names_from = Hit,
    values_from = Perc)

b <- ggplot(data = keymode_hit, aes(x=key_mode, y = `1`)) +
  geom_bar(stat="identity", color = "turquoise", fill = "darkturquoise") +
  ggtitle("Categorical Elements of Hit and Non-Hit Songs")+
  theme(plot.title = element_text(face="bold", size=12))+
  labs(y = "Percentage of Hits", x = "Key Mode") +
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 8))

c <-ggplot(data = keyname_hit, aes(x=key_name, y = `1`)) +
  geom_bar(stat="identity", color = "turquoise", fill = "darkturquoise") +
  ggtitle(" ")+
  labs(y = "Percentage of Hits", x = "Key Name") +
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 8))

d<-ggplot(data= songs, aes(x=time_signature)) +guides(fill="none")+
  geom_bar( position = position_dodge(), aes(fill = Hit))+
  labs(y = "Number of Songs", x = "Time Signature") +
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

e<-ggplot(data= songs, aes(x=explicit)) +
  geom_bar( position = position_dodge(), aes(fill = Hit))+
  labs(y = "Number of Songs", x = "Explicit") +
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

plot_3 <- plot_grid(b,c,d,e)
caption_3 <- add_sub(plot_3, "Distribution of musical features for 'hit' and 'non-hit' songs.",size=10)
caption_3 <- add_sub(caption_3, "Most songs are in time signature 4 and popular songs tend to be clean and are in all types of keys and modes.",size=10)
ggdraw(caption_3)

