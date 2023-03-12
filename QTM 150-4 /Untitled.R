# Relearning Everything 

## Importing Data Set 
setwd("~/Desktop/QTM 150-4") #Set your working directory 
gss <- read.csv("gss.csv", stringsAsFactors = TRUE) #Importing dataset and renaming it 
dim(gss) #Dataframe contains 53474 rows and 13 variables
set.seed(1234) #Generating a random number sequence 
nrow(gss) #Shows the total number of rows 
sample(nrow(gss), 100) #Randomly select 100 
gss100 <- gss[sample(nrow(gss),100),] #Assign 100 observations into an object called gss100
dim(gss100) # Found the dataframe of this set of 100 rows and 13 variables 
?sample #This will go to the help page so you can get more info about it 
write.csv(gss100, "smallgss.csv") #Creates a new dataset, now called gss100 

## Observing Data 
dim(gss100) #Again shows datafram contains of obversations and variables 
names(gss100) #Gives you the varaible names of the data set 
str(gss100) #Structure of dataset, names, different levels, some info, obs, and variables 
summary(gss100) #Summary of each variable, each level and the number of each 
head(gss100) #Print the first six observables 
tail(gss100, 10)# Prints the last ten observables
is.na(gss100$income) # Shows where an N/A is located 
sum(is.na(gss100$income)) # Prints the total number of missing values in the income variable 
sum(is.na(gss$income)) # Same thing but with the whole dataset 

## Extracting Parts 
# dataframe is a matrix, each variable (column) is a vector
gss100[1,2] # dataset[row,column]
gss100[1:5, c(2,5)] # dataset [row, column], : is for in between, and , is just focus on specfic values 
gss100[,7] #Focus on every row but a specific column 
gss100$marital #Shows the different levels 
gss100$marital[1:10] # Focuses the variable (column) and the number of rows you want to identify 

## Basic Plots 
# One Quantitative Variable:
hist(gss100$age) # Gives you a histogram of the the ages from the dataset 
mean(gss100$age) # Finds the mean within the variable 
sd(gss100$age)
# One Categorical Variable: 
table(gss100$marital) # Gives you a table with numbers of each category 
barplot(table(gss100$marital)) # Gives you a barplot with numbers of each category 
# One Quantitative Vs. One Categorical
boxplot(gss100$age~gss100$sex) # Gives you a boxplot with categorical on the bottom and numeric on the side 
# Two Quantitative Variables
plot(gss100$age~gss100$martial) # Gives a plot supposably 

## Vectors 
# Numeric Vector (integer & double)
c(1,2,3)
x <- c(1:10) # To save this to a named object
x # Once you type this in, it will show what you input 
y <- (30:1) # Samething as above 
y # Samething as above 
x[5] # Use the square bracket to extract the elemnt (value) 
x[c(1,3,5)] # Same idea as above 
x[3:7]
x[-c(1,3,5,7,9)] # Skips every other from this sequence 
seq(0,100,by=5) # The sequence of numbers from start to end by increments by some number of choice 
rep(2,5) # Repeats x value by how much you request 
x <- c(1:5)
rep(x,2)
y <- c(10:15)
rep(c(x,y),2) # Repeats x and y twice 
set.seed(1234) # set.seed() is used to fix the starting point to get a random sample, make sure to get the same sample when the code is executed each time
sample(1:30, 5, replace = TRUE) # Chooses 5 random values from the vector 
# You can do some math in here too 
x <- c(1:5)
x*2 # Multiplcation
x^2 # Power to 
7%%2 #  The modular operator, the remainder
7%/%2 # Division and does what's the nearest whole 
x%%2 # Odd number and even numbers 
y<-c(6:10)
x + y # The same length 
y - x
x
mean(x)
length(x)
avg_x <- sum(x)/length(x)
avg_x
a<-c(1, 5, 6, 8, 9, 15, 20, 19, 10)
sum(a%%2) # check odd numbers
# Character Vector: Vectors can be made up of strings of characters instead of numbers. 
schoolyear<-c("Freshman","Sophomore","Junior","Senior") # Same idea as renaming but with names in quotations
schoolyear
x<-c(2,4, 3,1) # Give the names to the numeric vector with the character vector
names(x)<-schoolyear 
x
substring(schoolyear,1,2) # simples the phrases
schoolyear1<-paste(schoolyear,"Year")
scoolyear1
paste("The",schoolyear,"Year", sep=" ") # adds the words in the "" into the already name vectors 
tolower(schoolyear)
toupper(schoolyear)
substr(state.name, 1, 1) # Basically says the first letter of each state 
tolower(state.name) 
# Logical Vector 
# greater than: $>$
# less than: $<$,
# equality: $==$,
# inequality: $!=$, $>=$, $<=$
# matching: $ %in% $
x
x <- c(1:5)
x
x>3 # Shows the truth values of values with in a vector of 1 to 5 and obviously only 4 and 5 
3==4 # True to make it equal but it should it was false
schoolyear %in% "Senior"# Tries to find a match within the vector with TRUE and FALSE values 
# With a logical data result, *TRUE* has an internal value of 1 and FALSE has an internal value of 0.  Summing a logical will evaluate the total number of *TRUE* results.
sum(x>3) # Shows the total value of the equation, which is 2 because of 4 and 5 
gss100subset<-gss100[gss100$year==2010,] #
head(gss100subset)
names(gss100subset)
state.name[substr(state.name,1,1)=="N"]
schoolyear[substr(schoolyear,1,1)=="S"]
# The Boolean operations can be encoded in R. $\&$ and $|$ mean *and* and *or*, $!$ means negative. These operations are very important to make a subset.
x <- c(1:20)
x1 <- subset(x, (x>10)& (x==12))
x1
x2 <- subset(x, (x<=5)| (x>14))
x2
gss2<- gss[gss$year==2010,]
gss2
# is.XXX(): is.na() and !is.na() is used to detect the missin values in the dataset 
sum(is.na(gss$martial)) #This will find the total of missing values within a certain variable 
sum(is.na(gss$region))
sum(is.na(gss$age))
sum(is.na(gss$age[gss$region=="SOUTH ATLANTIC"])) # Also find the total of missing variable but with more specific criteria 
mean(gss$age[gss$region=="SOUTH ATLANTIC"], na.rm=TRUE) # The missin values 
# is.vectortype() is used to check the type of the vector. 
is.character(state.name)
is.numeric(gss$age)
is.character(gss$marital)
str(gss)    

## Factor 
# The factors are used to store categorical variables with numeric data. labels + numbers. factor() is used to create a new factor. is.XXX() and class() are used to check specific type, as.XXX() is used to cast vectors to specific type.
str(gss)
levels(gss$region) # A factor has its own levels, labels +numbers 
schoolyear <- c("Freshman", "Sophomore", "Freshman", "Sophomore", "Senior", "Freshman", "Sophomore", "Junior")
class(schoolyear)
is.factor(schoolyear)
factor(schoolyear) # Both of this will show you all the results and the different values
is.factor(schoolyear)
schoolyear_factor<-as.factor(schoolyear)
is.factor(schoolyear_factor)
levels(schoolyear_factor) # Alphabetical order by default 
schoolyear_number<-as.numeric(schoolyear_factor)
schoolyear_number 
table(schoolyear) # categorical variable is summarized by frequency table 
barplot(table(schoolyear)) # barplot (frequency table)
barplot(table(schoolyear_factor))
# Reorder the levels of the factor. 
# Change ordering of the levels
# Vector <- factor(vector, levels=c ("level1", "level2", "level3"))
schoolyear_factor <- factor(schoolyear, levels=c("Freshman", "Sophomore", "Junior", "Senior"))
levels(schoolyear_factor)                              
barplot(table(schoolyear_factor))

#The follow is something you struggle with- Get it together <3
# Recode a factor/ Re-assign levels to a factor: Change values of a factor to NA 
levels(gss$happy)
# creating a new variable by copying the orginal one, making changes on the new one, 
# so that we don't change the orginal data 
# Create a new factor 
# new vectore <- factor (vector, levels = c("level1", "level2", "level3"))
gss$happy1 <- factor (gss$happy, levels= c("NOT TOO HAPPY", "PRETTY HAPPY", "VERY HAPPY"))
gss$happy1[gss$happy=="NOT TOO HAPPY"] <- "NOT TOO HAPPY"
gss$happy1[gss$happy== "PRETTY HAPPY"] <- "PRETTY HAPPY"
gss$happy1[gss$happy== "VERY HAPPY"] <- "VERY HAPPY"
gss$happy1[gss$happy==""| gss$happy=="DK"] <- NA
levels(gss$happy1)
barplot(table(gss$happy))
barplot(table(gss$happy1))

#Create a binary factor (shortcut ifelse())
