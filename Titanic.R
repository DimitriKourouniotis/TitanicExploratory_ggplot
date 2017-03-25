install.packages("ggplot2")
library(ggplot2)

## I have modified the following for the project submission:
## 1. included reading the titanic_original.csv file
## 1. removed an observation that had NA value for $gender 
## 2. converted the variable names to all lowercase in the R script
## 3. excluded the NA values for $age (by default)

install.packages("readr")
library(readr)

titanic_dataset <- read_csv("titanic_original.csv")

#remove NA $sex observations from dataset (one instance)
titanic <- titanic_original[!is.na(titanic_original$sex),]

# Check out the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(x=factor(pclass), fill=factor(sex)))+
  geom_bar(position="dodge")


# Use ggplot() for the second instruction
ggplot(titanic, aes(x=factor(pclass), fill=factor(sex)))+
  geom_bar(position="dodge")+
  facet_grid(". ~ survived")

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction
ggplot(titanic, na.rm= TRUE, aes(x=factor(pclass),y= age, col=factor(sex)))+
  geom_jitter(size=3, alpha=0.5, position=posn.j)+
  facet_grid(". ~ survived")
