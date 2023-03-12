# Importing data and saving data

movies <- read.csv("MOVIES.csv", stringsAsFactors = TRUE)
# This is just officially importing the data into RStudio 
dim(movies)
# This dataframe contains 6820 rows and 15 variables 
set.seed(1234)
# This shows generating a random number sequence 

# Make small datasets
nrow(movies)
# Just showed we have 6820 rows
sample(nrow(movies), 100)
# Randomly select 100 row numbers 
movies100 <- movies[sample(nrow(movies), 100),]
# Don't forget the end comma, just another relabeling 
dim(movies100)
# Make sure that 100 obersevables are assign in movies100 
write.csv(movies100, "smallmovies100.csv")
# Pretty cool I made a new small dataset 

# Observing Data 

dim(movies)
# Still the number of observations and variables 
names(movies)
# Lists the variable names 
str(movies)
# Structure of the dataset
summary(movies)
# Summary of each variable (category)
head(movies)
# Printed the first six observations (rows)
tail(movies, 10)
# Print the last 10 observations (rows)
is.na(movies$budget)
is.na(movies$company)
# Basically looks over a specific varaible, should show TRUE or FALSe 
sum(is.na(movies$budget))
#print a total number of missing values in the specific variable, basically empty boxes 

# Extracting Parts 

movies [1,2]
# Basically selects this specifc box, dataset[row, column]
movies [1:5, c(2,4)]
# Samething dataset[row, column], but not selecting more of a specific aray of data 
movies [,4]
# Basically all of column 4 
movies$rating
# Basically lists this specific column title
movies$rating[1:10]
# Now selecting for this specific column title with a certain number of rows 

# Basic Plots 

# One variable: histogram/ #hist(gss100$age) 
hist(movies$gross)
# One categorical: barplot(categorical)/ table(gss100$marital) OR barplot(table(gss100$marital))
table(movies$rating)
barplot(table(movies$rating))
# Two variables: scatterplot(two quant), side-by-side boxplot(quant vs cat)
mean(movies$gross)
# Find the mean for this specific vector, [1] 33497829
# one quantitative vs one categorical/ Example:boxplot(gss100$age~gss100$sex)
boxplot(movies$company~movies$name)
# two quantitative variables/ Example: plot(x,y)
plot (movies$budget,movies$gross)
# This is example of plot and one is on the x and the other is y

# Vectors

# c () is use to keep groupings together in a vector
c(1,2,3)
# Results then were [1] 1 2 3
# We can save this to a named object:
x<-c(1:10)
# The : sybmbol used to create a sequence of increasing (or decreasing) values x
x
# use the square bracket to extract the element(value)
x[5] 
x[-c(1,3,5,7,9)]
# skips every other 
# seq(start, end, by=1)
seq(0,100,by=5) # the sequence of numbers from 0 to 100 with the increment is 5
seq(0,100, by=5)
# rep(x, times of repetition)
rep(2,5)    # repeat the value 2, 5 times
# x<-c(1:5)
# rep(x,2)  # repeat x twice
# y<-c(10:15)
# rep(c(x,y),2)  # repeat x and y, twice

# Movie data set problems 

dim(movies)
names(movies)
head(movies, 10)
movies2 <- movies[, c(5, 6, 7, 8, 11)]
head(movies2, 2)
movies_rated <- subset(movies, (movies$rating== c("G", "PG", "PG-13", "R")))
summary(movies_rated$rating)
goodmovies <- subset(movies_rated, (movies_rated$score >= 7))
dim(goodmovies)
summary(movies$gross)
highgross <- subset(movies, (movies$gross >= 40065340))
scoreshg <- highgross[,11]
mean(scoreshg)
pg13 <- subset(movies_rated, (movies_rated$rating == "PG-13"))
summary(pg13)
pg13score <- pg13[,11]
mean(pg13score)
pg13gross <- pg13[,6]
mean(pg13gross)
ratedr <- subset(movies_rated, (movies_rated$rating == "R"))
summary(ratedr)
ratedrscore <- ratedr[,11]
mean(ratedrscore)
ratedrgross <- ratedr[,6]
mean(ratedrgross)
goodmoviesgross <- goodmovies[,6]
mean(goodmoviesgross)
highgrossscore <- highgross[,11]
mean(highgrossscore)
movies3 <- subset(movies, (movies$score >= 7) & (movies$gross >= 40065340))
summary(movies3)
dim(movies3)
scatter.smooth(movies3$score, movies3$gross)n
n

names(movies)
Comedy <- subset (movies, (movies$genre== c("comedy")))
Comdy_USA <- subset (comedy, (movies$country== c("USA")))


numbers <- matrix(, nrow=5, ncol=2, byrow=FALSE, dimnames=NULL)
numbers
Comdy_USA <- subset(movies, (movies$genre==c("comedy")) & (movies$genre ==USA))

