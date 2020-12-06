## Final Project- Folkenroth/Stape: Pokemon Data
## Semester: Fall 2020

rm(list= ls())
library(tidyverse)
library(psych)

### Read File 
pokemonFile <- file.choose()
pokemonData <- read.csv(pokemonFile)

### View Data
View(pokemonData)


### Create Variables 
## By Generations
gen1 <- pokemonData %>% filter(pokemonData$Generation == 1)
gen2 <- pokemonData %>% filter(pokemonData$Generation == 2)
gen3 <- pokemonData %>% filter(pokemonData$Generation == 3)
gen4 <- pokemonData %>% filter(pokemonData$Generation == 4)
gen5 <- pokemonData %>% filter(pokemonData$Generation == 5)
gen6 <- pokemonData %>% filter(pokemonData$Generation == 6)


## By Types
normal <- pokemonData %>% filter(pokemonData$Type.1 == "Normal" | pokemonData$Type.2 =="Normal")
fire <- pokemonData %>% filter(pokemonData$Type.1 == "Fire" | pokemonData$Type.2 == "Fire")
water <- pokemonData %>% filter(pokemonData$Type.1 == "Water" | pokemonData$Type.2 == "Water")
electric <- pokemonData %>% filter(pokemonData$Type.1 == "Electric" | pokemonData$Type.2 == "Electric")
grass <- pokemonData %>% filter(pokemonData$Type.1 == "Grass" | pokemonData$Type.2 == "Grass")
ice <- pokemonData %>% filter(pokemonData$Type.1 == "Ice" | pokemonData$Type.2 == "Ice")
fighting <- pokemonData %>% filter(pokemonData$Type.1 == "Fighting" | pokemonData$Type.2 == "Fighting")
posion <- pokemonData %>% filter(pokemonData$Type.1 == "Poison" | pokemonData$Type.2 == "Posion")
ground <- pokemonData %>% filter(pokemonData$Type.1 == "Ground" | pokemonData$Type.2 == "Ground")
flying <- pokemonData %>% filter(pokemonData$Type.1 == "Flying" | pokemonData$Type.2 == "Flying")
psychic <- pokemonData %>% filter(pokemonData$Type.1 == "Psychic" | pokemonData$Type.2 == "Psychic")
bug <- pokemonData %>% filter(pokemonData$Type.1 == "Bug" | pokemonData$Type.2 == "Bug")
rock <- pokemonData %>% filter(pokemonData$Type.1 == "Rock" | pokemonData$Type.2 == "Rock")
ghost <- pokemonData %>% filter(pokemonData$Type.1 == "Ghost" | pokemonData$Type.2 == "Ghost")
dragon <- pokemonData %>% filter(pokemonData$Type.1 == "Dragon" | pokemonData$Type.2 == "Dragon")
dark <- pokemonData %>% filter(pokemonData$Type.1 == "Dark" | pokemonData$Type.2 == "Dark")
steel <- pokemonData %>% filter(pokemonData$Type.1 == "Steel" | pokemonData$Type.2 == "Steel")
fairy <- pokemonData %>% filter(pokemonData$Type.1 == "Fairy" | pokemonData$Type.2 == "Fairy")


## By Multiple Types
oneType <- pokemonData %>% filter(pokemonData$Type.2 == "")
twoType <- pokemonData %>% filter(pokemonData$Type.2 != "")


## By Legendary
legendary <- pokemonData %>% filter(pokemonData$Legendary == "True")
nonLegendary <- pokemonData %>% filter(pokemonData$Legendary == "False")



### Tests and Plots

# Pairs Panels
pairs.panels(pokemonData)

pairs.panels(legendary)
pairs.panels(nonLegendary)

pairs.panels(oneType)
pairs.panels(twoType)


# Facet Plots
ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Sp..Atk)) + facet_grid(. ~ Generation)

ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Sp..Atk)) + facet_grid(. ~ Type.1)
