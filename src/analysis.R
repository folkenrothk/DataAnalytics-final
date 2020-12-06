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


### Create Variables (to potentially use)
## By Generations
gen1 <- pokemonData %>% filter(pokemonData$Generation == 1)
gen2 <- pokemonData %>% filter(pokemonData$Generation == 2)
gen3 <- pokemonData %>% filter(pokemonData$Generation == 3)
gen4 <- pokemonData %>% filter(pokemonData$Generation == 4)
gen5 <- pokemonData %>% filter(pokemonData$Generation == 5)
gen6 <- pokemonData %>% filter(pokemonData$Generation == 6)


## By Types
ghost <- pokemonData %>% filter(pokemonData$Type.1 == "Ghost" | pokemonData$Type.2 == "Ghost")
fighting <- pokemonData %>% filter(pokemonData$Type.1 == "Fighting" | pokemonData$Type.2 == "Fighting")


## By Multiple Types
oneType <- pokemonData %>% filter(pokemonData$Type.2 == "") ## Create data set with pokemon w/ only one type
twoTypes <- pokemonData %>% filter(pokemonData$Type.2 != "") ## Create data set with pokemon w/ two types


multiType <- mutate(pokemonData, pokemonData$Type.2 != "") ## when true == 2 type pokemon
view(twoType)

## By Legendary
legendary <- pokemonData %>% filter(pokemonData$Legendary == "True")
nonLegendary <- pokemonData %>% filter(pokemonData$Legendary == "False")



### Tests and Plots

# Pairs Panels
pairs.panels(pokemonData)

pairs.panels(legendary)
pairs.panels(nonLegendary)

pairs.panels(oneType)
pairs.panels(twoTypes)
pairs.panels(multiType)


# Facet Plots
ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Sp..Atk)) + facet_grid(. ~ Generation)
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Sp..Atk, color = Generation)) 


ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Speed)) + facet_grid(. ~ Generation)
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Speed, color = Generation)) 


ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$HP, color = Type.1))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Attack, color = Type.1))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Defense, color = Type.1))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Sp..Atk, color = Type.1))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Sp..Def, color = Type.1))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Speed, color = Type.1))

ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Attack, color = Legendary))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Sp..Atk, color = Legendary))

ggplot(data = nonLegendary) + geom_point(mapping = aes(x = Total, y = Attack, color = Generation))


ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Type.1, color = Generation))
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Type.1, color = Generation)) + facet_grid(. ~ Type.2)
ggplot(data = twoType) + geom_point(mapping = aes(x = Total, y = Type.1, color = twoType$`pokemonData$Type.2 != ""`))

pairs.panels(ghost)
pairs.panels(fighting)

