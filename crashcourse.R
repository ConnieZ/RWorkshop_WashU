##############################################
# Presentation code for 05/04/2015 Crash course in R


install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)


Age <- c(25, 35, 40, 12)

patients <- data.frame(PatientID = c(1, 2, 3, 4),
                       Age = c(25, 35, 40, 12),
                       Gender = c("F", "M", "F", "M"),
                       Diabetes = c("Y", "N", "N", "N"))

###############################################
# practice exe 1

# read in the NYC flights data sample for 2013
nycflights <- read.csv(url("http://statadata.gwb.wustl.edu/nycfl13sample.csv"))

# View it from the RStudio Environment
# Can we tell how many variables and observations the data has?


###############################################
# Metadata
# num of cols, rows, var name and type, some values
str(patients)

# statistics on continuous variables, freq on factors
summary(patients)

# column names
names(patients)

# number of columns, number of rows
ncol(patients) 
nrow(patients)

###############################################
# practice exe 2

# Answer these questions about the dataset:
# name two number vars in the dataset

# name two factor vars in the dataset

# what is the median and mean of air time (min)?

# what is the frequency of origin categories?

# Try to write all the functions from previous slide


###############################################
# Data Types
# number
c(3, 20, 10) + c(30, 10, 15)

# strings
c('Ami', 'Paul', c('Angie', 'Pat'))

# factors
levels(patients$Gender)

# logicals
is.na(c(3, 4, NA, 10))

c(3, 4, NA, 10) != 4

###############################################
# practice exe 3

# Name some of the levels of airline variable.


# Does the dep_delay (departure delay) variable contain any NAs? 
# HINT: use table() function from below


# Is there ever distance over 4000 miles? 
# HINT: use table() function from below
  


###############################################
# Describing Data

# one-way crosstable (frequencies)
table(patients$Gender)
# two-way crosstable
table(patients$Gender, patients$Diabetes)

# distribution
summary(patients$Age)
psych::describe(patients)
fivenum(patients$Age)
quantile(patients$Age)
 
# Slicing and Dicing
IDs <- patients$PatientID
IDs <- patients[,1]

row2 <- subset(patients, PatientID==2)
row2<- patients[2,]

singlecell <- patients[4,3]
singlecell <- patients$Gender[4]

# Conditional (logical) subsetting:
patients[patients$Age > 12,]
subset(patients, Age > 12)

patients[patients$Age > 12 & patients$Gender == "M",]

head(patients)
tail(patients,2)


###############################################
# practice exe 4

# Practice two ways to select carrier variable (7th col).

# Practice two ways to select flights with carrier UA . Practice how to select only the 1st row.

# Practice two ways to select 20th row, 7th column (carrier var). What's the value?

# How would you select all the flights with positive departure delay (dep_delay var)? (use subset())

# Create a crosstable of airline and origin. What airline only flies from Newark airport?


###############################################
# Creating New Variables
patients$BloodSugar <- c(140, 135, 126, 112)


# Math functions: 
sqrt(patients$Age)
log(patients$Age)
mean(patients$Age)
max(patients$Age)
sum(patients$Age)

# Data Wrangling: 
# unique values: 
length(unique(patients$PatientID))

# run library(dplyr) if you haven't already for the following functions to work

n_distinct(patients$PatientID)

# remove duplicate rows
distinct(patients)

# filtering columns
select(patients, contains("a"))
# filtering rows
dplyr::filter(patients, Age > 12)

# aggregating (collapsing)
aggregate(patients$Age, by = list(Gender=patients$Gender), FUN=mean)

patients %>% group_by(Gender) %>% summarise(avg=mean(Age))

# aggregating using NYC flights data
aggregate(nycflights$dep_delay, by = list(Delay=nycflights$airline), FUN=mean, na.rm=T)

filter(nycflights, !is.na(dep_delay)) %>% group_by(airline) %>% summarise(avg=mean(dep_delay))


# merging
# newdf <- merge(data1, data2, by="ID")

# Basic Plotting:
# barplot
plot(patients$Gender) # has to be factor var
plot(patients$Gender, main = "Gender Freq", xlab = "Gender", ylab = "Frequency")

# histogram
hist(patients$Age)

# scatterplot
plot(patients$Age, patients$BloodSugar)

qplot(x = Age, y = BloodSugar, color = Gender, data = patients, geom = "point")

# plotting NYC flights data
plot(nycflights$origin, main = "Airport Freq", xlab = "Airport", ylab = "Frequency")


###############################################
# practice exe 5

# Plot a scatterplot using qplot() function, to look at relationship between dep_delay 
# and visib (visibility). Use origin for color groups.



###############################################
# exporting data
write.csv(transformed, "transformed.csv", row.names = F)