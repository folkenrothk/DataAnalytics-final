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
## By Generations //unNeeded //
##### gen1 <- pokemonData %>% filter(pokemonData$Generation == 1)
##### gen2 <- pokemonData %>% filter(pokemonData$Generation == 2)
##### gen3 <- pokemonData %>% filter(pokemonData$Generation == 3)
##### gen4 <- pokemonData %>% filter(pokemonData$Generation == 4)
##### gen5 <- pokemonData %>% filter(pokemonData$Generation == 5)
##### gen6 <- pokemonData %>% filter(pokemonData$Generation == 6)


## By Types
ghost <- pokemonData %>% filter(pokemonData$Type.1 == "Ghost" | pokemonData$Type.2 == "Ghost")
fighting <- pokemonData %>% filter(pokemonData$Type.1 == "Fighting" | pokemonData$Type.2 == "Fighting")


## By Multiple Types
oneType <- pokemonData %>% filter(pokemonData$Type.2 == "") ## Create data set with pokemon w/ only one type
twoTypes <- pokemonData %>% filter(pokemonData$Type.2 != "") ## Create data set with pokemon w/ two types

multiType <- mutate(pokemonData, pokemonData$Type.2 != "") ## when true == 2 type pokemon
multiType <- multiType %>% rename(Multiple.Types= `pokemonData$Type.2 != ""`) 


## By Legendary
legendary <- pokemonData %>% filter(pokemonData$Legendary == "True")
nonLegendary <- pokemonData %>% filter(pokemonData$Legendary == "False")



### Tests and Plots

# Pairs Panels

pairs.panels(pokemonData) ## fullData

pairs.panels(legendary) ##only legendary
pairs.panels(nonLegendary) ##non legendary

pairs.panels(oneType) ## only pokemon with one type
pairs.panels(twoTypes) ## only pokemon with two types
pairs.panels(multiType) ## added a column, true = two types

pairs.panels(ghost) ## looking at only Ghost type pokemon
pairs.panels(fighting) ## looking at only Fighting type pokemon


# Scatter Plots

## Full Dataset
### total vs special attack, sort by generation
#### facet by generation
ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Sp..Atk)) + facet_grid(. ~ Generation)
#### color by generation
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Sp..Atk, color = Generation)) 

### total vs speed, sort by generation
#### fact by generation
ggplot(data = pokemonData) + geom_point(mapping = aes(x = pokemonData$Total, y = pokemonData$Speed)) + facet_grid(. ~ Generation)
#### color by generation
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Speed, color = Generation)) 




### Total vs all stats, color by type.1
#### HP
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$HP, color = Type.1))
#### Attack
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Attack, color = Type.1))
#### Defense
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Defense, color = Type.1))
#### Special Attack
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Sp..Atk, color = Type.1))
#### Special Defense
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Sp..Def, color = Type.1))
#### Speed
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Speed, color = Type.1))




### sort by Legendary (color)
#### total vs attack
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = pokemonData$Attack, color = Legendary))
#### total vs special attack
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Sp..Atk, color = Legendary))


## Filtered Dataset: NonLegendary (legendary pokemon excluded)
### total vs attack, color by generation
ggplot(data = nonLegendary) + geom_point(mapping = aes(x = Total, y = Attack, color = Generation))




## Full Dataset 
### total vs type.1, color = generation
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Type.1, color = Generation))
### add facet grid of type.2
ggplot(data = pokemonData) + geom_point(mapping = aes(x = Total, y = Type.1, color = Generation)) + facet_grid(. ~ Type.2)


## Mutated Dataset: MultiType (includes column, true = 2 type pokemon // false = only 1 type pokemon)
### total vs type.1, color= multitype (newColor)
ggplot(data = multiType) + geom_point(mapping =aes( x = Total, y = Type.1, color = Multiple.Types))


