# Importing data and Saving Data 

movies <- read.csv("MOVIES.csv.numbers", stringsAsFactors = TRUE)
# When selecting files do it from the name based on the box in the right bottom corner
dim(movies)
# Contains 27436 observations and 1 variable, Results look like [1] 27436     1
set.seed(1000)
# this is generating a random number sequence 
nrow(movies)
# the total number of rows in movies [1] 27436
sample(nrow(movies), 100)
# Cool this randomly select 100 row numbers 
movies100 <- movies[sample(nrow(movies), 100),]
# Just reassignment 
dim(movies100)
# Make sure 100 observations are assigned in movies100 https://canvas.emory.edu/courses/108934/modules/items/1959130
write.csv(movies100, "smallmovies.csv")
# Wow this is cool it creates a new dataset with these 100 

# Observing Data 

dim(movies100)
dim(movies)
# I got NULL but in the example I guess I was suppose to have some values 
names(movies100)
names(movies)
# This is suppose to give variable names 
str(movies100)
# structure of dataset 
summary(movies100)
# summary of each variable 
head(movies100)
# print the first six observations 
tail(movies100, 10)
# Print the last 10 obersations

# Extracting parts 

movies[1:10,]
# dataset [row, column]
movies[1:10,2]
# dataset[rows, columns]
movies[,1]
# dataset, the whole column 
head(movies100, 10)
head(movies, 10)
head(movies)
head(movies)


# 9/13  In Class Notes 
# setting it as string As Factors = TRUE allows you to rename favotres 
# NA's are the missing values 
# Summary you get NA's but not in Table 
# How to assign to degree gss$degreee2 <- gass$degree
# In order to assign with order gss$degree2 <- factor (gss$degreek levels = c ("LT HIGH SCHOOL", "HIGH SCHOOL"... etc) order=TRUE 
# Figure out what | means 
# Quiz on this ^ 

