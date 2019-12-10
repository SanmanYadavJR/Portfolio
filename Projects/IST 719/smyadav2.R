library(plotly)
library(tidyverse)
library(ggplot2)
library(data.table)
library(gridExtra)
library(knitr)
library(maps)
library(dplyr)
library(rworldmap)



data1 <- read.csv("athlete_events.csv", 
                 stringsAsFactors = FALSE)

data2 <-read.csv("noc_regions.csv",
                 stringsAsFactors = FALSE)

data_regions <- data1 %>% 
  left_join(data2,by="NOC") %>%
  filter(!is.na(region))


goldw <- data_regions %>% filter(Medal == "Gold") %>%
  group_by(region) %>%
  summarise(goldw = n())

silverw <- data_regions %>% filter(Medal == "Silver") %>%
  group_by(region) %>%
  summarise(silverw = n())

bronzew <- data_regions %>% filter(Medal == "Bronze") %>%
  group_by(region) %>%
  summarise(bronzew = n())

allw <- data_regions %>% filter(Medal != 0) %>%
  group_by(region) %>%
  summarise(allw = n())

allw <- allw %>% left_join(goldw)
allw <- allw %>% left_join(silverw)
allw <- allw %>% left_join(bronzew)

allw$goldw[is.na(allw$goldw)] <- 0
allw$silverw[is.na(allw$silverw)] <- 0
allw$bronzew[is.na(allw$bronzew)] <- 0
allw$allw[is.na(allw$allw)] <- 0

world1 <- map_data("world")

mapdata <- tibble(region = unique(world1$region))

mapdata <- mapdata %>%
  left_join(allw, by = "region")

mapdata$allw[is.na(mapdata$allw)] <- 0
mapdata$goldw[is.na(mapdata$goldw)] <- 0
mapdata$silverw[is.na(mapdata$silverw)] <- 0
mapdata$bronzew[is.na(mapdata$bronzew)] <- 0

world1 <- left_join(world1, mapdata, by = "region")

ggplot(world1, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = allw)) +
  labs(title = "Medals Won By Countries",
       x = NULL, y=NULL)+
  scale_fill_gradient(low = "brown",
                      high = "gold")
# Art Compitations

art <- data1 %>% 
  filter(Sport == "Art Competitions") %>%
  select(Name, Sex, Age, Team, NOC, Year, City, Event, Medal)

counts_art <- art %>% filter(Team != "Unknown") %>%
  group_by(Year) %>%
  summarize(
    Events = length(unique(Event)),
    Nations = length(unique(Team)),
    Artists = length(unique(Name))
  )

plot1 <- ggplot(counts_art, aes(x=Year, y=Nations)) +
  geom_point(size=2) +
  geom_line() + xlab("")

plot2 <- ggplot(counts_art, aes(x=Year, y=Artists)) +
  geom_point(size=2) +
  geom_line()

grid.arrange(plot1, plot2, ncol = 1)

#germany dominate the 1936 olympics
medal_counts_art_nazis <- art %>% filter(Year==1936, !is.na(Medal))%>%
  group_by(Team, Medal) %>%
  summarize(Count=length(Medal))

levs_art_nazis <- medal_counts_art_nazis %>%
  group_by(Team) %>%
  summarize(Total=sum(Count)) %>%
  arrange(Total) %>%
  select(Team)

medal_counts_art_nazis$Team <- factor(medal_counts_art_nazis$Team, 
                                      levels=levs_art_nazis$Team)

View(medal_counts_art_nazis)

ggplot(medal_counts_art_nazis, aes(x=Team, y=Count, fill=Medal)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values=c("gold4","gray70","gold1")) +
  ggtitle("Germany dominate the Art Competitions at the 1936 Olympics") +
  theme(plot.title = element_text(hjust = 0.5))

#Top Athletes
#USA
USAbest <- data1 %>% 
  filter(Name == "Michael Fred Phelps, II") %>%
  select(Sport, Medal)

USAbest$Medal[is.na(USAbest$Medal)] <- 0

goldUSA <- USAbest %>% filter(Medal == "Gold") %>%
  group_by(Sport) %>%
  summarise(goldUSA = n())

silverUSA <- USAbest %>% filter(Medal == "Silver") %>%
  group_by(Sport) %>%
  summarise(silverUSA = n())

bronzeUSA <- USAbest %>% filter(Medal == "Bronze") %>%
  group_by(Sport) %>%
  summarise(bronzeUSA = n())

goldUSA <- goldUSA %>% left_join(silverUSA)
goldUSA <- goldUSA %>% left_join(bronzeUSA)

pieUSA <- select(goldUSA, goldUSA, silverUSA, bronzeUSA)

x <- c(23, 3, 2)
labels <- c("Gold", "Silver", "Bronze")

pie(x, labels, main = "MPII", col = rainbow(length(x)))

#Larysa
Sovbest <- data1 %>% 
  filter(Name == "Larysa Semenivna Latynina (Diriy-)") %>%
  select(Sport, Medal)

Sovbest$Medal[is.na(Sovbest$Medal)] <- 0

SovGold <- Sovbest %>% filter(Medal == "Gold") %>%
  group_by(Sport) %>%
  summarise(SovGold = n())

SovSilver <- Sovbest %>% filter(Medal == "Silver") %>%
  group_by(Sport) %>%
  summarise(SovSilver = n())

SovBronze <- Sovbest %>% filter(Medal == "Bronze") %>%
  group_by(Sport) %>%
  summarise(bronzeUSA = n())

SovGold <- SovGold %>% left_join(SovSilver)
SovGold <- SovGold %>% left_join(SovBronze)

x1 <- c(9, 5, 4)
labels1<- c("Gold", "Silver", "Bronze")
pie(x1, labels1, main = "Larysa", col = rainbow(length(x1)))

#Paavo Nurmi

Finbest <- data1 %>% 
  filter(Name == "Paavo Johannes Nurmi") %>%
  select(Sport, Medal)

Finbest$Medal[is.na(Finbest$Medal)] <- 0

FinGold <- Finbest %>% filter(Medal == "Gold") %>%
  group_by(Sport) %>%
  summarise(FinGold = n())

FinSilver <- Finbest %>% filter(Medal == "Silver") %>%
  group_by(Sport) %>%
  summarise(FinSilver = n())

FinBronze <- Finbest %>% filter(Medal == "Bronze") %>%
  group_by(Sport) %>%
  summarise(FinBronze = n())


FinGold <- FinGold %>% left_join(FinSilver)
FinGold <- FinGold %>% left_join(FinBronze)

x2 <- c(9, 3, 0)
labels2 <- c("Gold", "Silver", "Bronze")

pie(x2, labels2, main = "Paavo", col = rainbow(length(x1)))

