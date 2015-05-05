##############################################
# Practice Exercises code for 05/04/2015 Crashcourse in R

# practice exe 1
nycflights <- read.csv(url("http://statadata.gwb.wustl.edu/nycfl13sample.csv"))

# practice exe 2
# Answer these questions about the dataset:
# name two number vars in the dataset
# name two factor vars in the dataset
str(nycflights)

# what is the median and mean of air time (min)?
# what is the frequency of origin categories?
summary(nycflights)

names(nycflights)

nrow(nycflights)

ncol(nycflights)

# practice exe 3
# Name some of the levels of airline variable.
levels(nycflights$airline)

# Does the dep_delay (departure delay) variable contain any NAs? 
# HINT: use table() function from below
table(is.na(nycflights$dep_delay))

# Is there ever distance over 4000 miles? 
# HINT: use table() function from below
table(nycflights$distance > 4000)

# practice exe 4

# Practice two ways to select carrier variable (7th col).
carriers <- nycflights$carrier
carriers <- nycflights[,7]

# Practice to select flights with carrier UA . Practice how to select only the 1st row.
row1 <- subset(nycflights, tailnum=="N24211")
row1 <- nycflights[1,]

# Practice two ways to select 20th row, 7th column (carrier var). What's the value?
singlecell <- nycflights[20,8]
singlecell <- nycflights$carrier[20]

# How would you select all the flights with positive departure delay (dep_delay var)? (use subset())
late <- subset(nycflights, dep_delay > 0)
late2 <- nycflights[nycflights$dep_delay > 0 & !is.na(nycflights$dep_delay),]

# Create a crosstable of airline and origin. What airline only flies from Newark airport?
table(nycflights$airline, nycflights$origin)

# practice exe 5

# Plot a scatterplot using qplot() function, to look at relationship between dep_delay 
# and visib (visibility). Use origin for color groups.
qplot(x = dep_delay, y = visib, color = origin, data = nycflights, geom = "point")

