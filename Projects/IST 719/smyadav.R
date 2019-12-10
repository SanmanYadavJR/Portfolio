# project

install.packages("plotly")
library(plotly)

install.packages("tidyverse")
library(tidyverse)

library(ggplot2)

library(data.table)

library(gridExtra)

library(knitr)



getwd()
data <- read_csv("athlete_events.csv",
                 col_types = cols(
                   ID = col_character(),
                   Name = col_character(),
                   Sex = col_factor(),
                   Age = col_integer(),
                   Height = col_double(),
                   Weight = col_double(),
                   Team = col_character(),
                   NOC = col_character(),
                   Games = col_character(),
                   Year = col_integer(),
                   Season = col_factor(levels = c("Summer", "Winter")),
                   City = col_character(),
                   Sport = col_character(),
                   Event = col_character(),
                   Medal = col_factor(levels = c("Gold", "Silver", "Bronze"))
                 ))

#Q1 #Female Participation

temp <- filter(data, data$Sport != "Art Competitions")

#Changing the year in temp to match that of winter

original <- c(1994, 1998, 2002, 2006, 2010, 2014)
new  <- c(1996, 2000, 2004, 2008, 2012, 2016)

for (i in 1:length(original)){
  temp$Year <- gsub(original[i], new[i], temp$Year)
}

temp$Year <- as.integer(temp$Year)

c_sex <- temp %>% group_by(Year, Sex) %>%
  summarise(Athletes = length(unique(ID)))
c_sex$Year <- as.integer(c_sex$Year)

#Plot
ggplot(c_sex, aes(x = Year, y = Athletes, group = Sex, color = Sex)) +
  geom_point(size = 2) +
  geom_line() +
  scale_color_manual(values = c("Red", "Blue")) +
  labs(title = "Number of Male and Female in Olympics") +
  theme(plot.title = element_text(hjust = 0.5))

#Q2 Medals Summary

gold <- data %>% filter(Medal == "Gold") %>%
  group_by(Year, Season, Team) %>%
  summarise(gold = n())

silver <- data %>% filter(Medal == "Silver") %>%
  group_by(Year, Season, Team) %>%
  summarise(silver = n())

bronze <- data %>% filter(Medal == "Bronze") %>%
  group_by(Year, Season, Team) %>%
  summarise(bronze = n())

all <- data %>% filter(Medal != "<NA>") %>%
  group_by(Year, Season, Team) %>%
  summarise(all = n())

all <- all %>% left_join(gold)
all <- all %>% left_join(silver)
all <- all %>% left_join(bronze)

#Setting all nas to zero
all$gold[is.na(all$gold)] <- 0
all$silver[is.na(all$silver)] <- 0
all$bronze[is.na(all$bronze)] <- 0
all$all[is.na(all$all)] <- 0

#Plotting 4 best countries in the olympics by medals and gold
all4 <- filter(all, Season == "Summer")
allnew <- filter(all4, Team == "United States" | Team == "Russia" | Team == "Germany" | Team == "France")


ggplot(allnew, aes(x = Year, y = all, group = Team)) +
  geom_line(aes(color = Team)) +
  geom_point(aes(color = Team)) +
  theme_minimal()

ggplot(allnew, aes(x = Year, y = gold, group = Team)) +
  geom_line(aes(color = Team)) +
  geom_point(aes(color = Team)) +
  theme_minimal()

#grid.arrange(plot1, plot2, ncols = 1)

#Q3. Average Age of Atheltes

medals <- data %>% 
  filter(!is.na(Medal))

summ_med <- medals %>%  filter(Season == "Summer")%>%
  group_by(Year, Season, Medal) %>%
  summarise(mean = mean(Age, na.rm = TRUE))


ggplot(summ_med, aes(x = Year, y = mean, group = Medal, color = Medal)) +
  geom_point(size = 2) +
  geom_line() +
  ggtitle("Summer Oly Avg Age.")

summ_med_sex <- medals %>%  filter(Season == "Summer")%>%
  group_by(Year, Sex) %>%
  summarise(mean = mean(Age, na.rm = TRUE))

ggplot(summ_med_sex, aes(x = Year, y = mean, group = Sex, color = Sex)) +
  geom_point(size = 2) +
  geom_line() +
  ggtitle("Summer Oly Avg Age. by Sex") +
  ylim(20, 35)

#World Map
library(maps)
library(dplyr)
map("world", "India")

worlddata <- select(data, Team, NOC, Medal)

worlddata$Medal[is.na(worlddata$Medal)] <- 0


goldworld <- worlddata %>% filter(Medal == "Gold") %>%
  group_by(Team, NOC) %>%
  summarise(goldworld = n())

silverworld <- worlddata %>% filter(Medal == "Silver") %>%
  group_by(Team, NOC) %>%
  summarise(silverworld = n())

bronzeworld <- worlddata %>% filter(Medal == "Bronze") %>%
  group_by(Team, NOC) %>%
  summarise(bronzeworld = n())


allworld <- worlddata %>% filter(Medal != 0) %>%
  group_by(Team, NOC) %>%
  summarise(allworld = n())

allworld <- allworld %>% left_join(goldworld)
allworld <- allworld %>% left_join(silverworld)
allworld <- allworld %>% left_join(bronzeworld)

allworld$goldworld[is.na(allworld$goldworld)] <- 0
allworld$silverworld[is.na(allworld$silverworld)] <- 0
allworld$bronzeworld[is.na(allworld$bronzeworld)] <- 0
allworld$allworld[is.na(allworld$allworld)] <- 0
