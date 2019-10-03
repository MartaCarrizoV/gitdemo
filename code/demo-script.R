# ===================================================================
# Title: Lab 05
# Description:
#   Get familiar with git and more bash commands.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Marta Carrizo Vaque
# Date: 10-03-2019
# ===================================================================

# packages
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

#I read the data of nba2018-players.csv
dat <- read.csv("./../data/nba2018-players.csv"
                , sep=",")

#I create a data frame of the warriors
warriors <- dat %>% filter(team == 'GSW') %>% 
  arrange(salary)

#I export this file
write.csv(warriors, file = "../data/warriors.csv", row.names = FALSE)

#EXPORTING SOME R OUTPUTS

#I sink basic statistics
sink(file = '../output/summary-height-weight.txt')
summary(dat[ ,c('height', 'weight')])
sink()

#I export the output of str() of dat
sink(file="../output/data-structure.txt")
str(dat)
sink()

#I export the summary of the warriors
sink(file = "../output/summary-warriors.txt")
summary(warriors)
sink()

#I create a data frame with the lakers information
#Then I export its summary
lakers <- filter(dat, team == 'LAL')
sink(file = "../output/summary-lakers.txt")
summary(lakers)
sink()


#EXPORTING GRAPHS

#I create a scatterplot
png(filename = "../images/scatterplot-height-weight.png")
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

#I create a histogram of the age.
jpeg(filename = "../images/histogram-age.jpeg", width = 600, 
     height = 400)
hist(dat$age)
dev.off()

#I create a scatterplot of height and weight
png(filename = "../images/scatterplot2-height-weight.png",
    pointsize = 0.01)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()







