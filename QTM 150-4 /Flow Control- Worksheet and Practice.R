# Flow Control- Worksheet and Practice 
    # Some control statements affect or control the execution of other statements in some way.

# ifelse() function 
  # ifelse() function in R, this function has the form -> ifelse (testexpression, yes, no)
    # "testexpression" is the logical condition, "yes" is what ifelse() will return if the logical testexpression is truem and "no is what ifelse() returns when false 
  # Example 1: Convert a character vector to a numeric vector (ifelse function)
x <- c("female", "male", "male", "female", "female", "male", "female")
x
class(x) #tells you if it's numeric or character 
y <- ifelse(x=="female", 0, 1) # the 0 basically means female while 1 means male 
y    
class(y) # now it's numerica but basically says the same stuff 
  

  # Example 2: Convert unifrom random numbers to binomail random numbers 
# runif(n, parameters of distribution) create random numbers from some specific probability distrubition 
x <-runif(10,0,10) # create random numbers form a uniform distribiton from 0 to 10 
x
ifelse(x > 5,1,0) #returns 1 for values greater than 5, and 0 for the others 

  #Try this: import gss_cat dataset, create a new variable racenew only with values 0 and 1, 1 presents white, 0 represents non-white 
library(dplyr)
library(lubridate)
library(forcats)
library(babynames)
library(tidyverse)
library(ggplot2)
library(nycflights13)
str(gss_cat)
levels(gss_cat$race)

racenew <- ifelse(gss_cat$race== "White",1,0)
racenew
str(gss_cat)
head(gss_cat)
gss_cat1 <- gss_cat%>%
  mutate(racenew = ifelse(race== "White", 1, 0)) # What actually matters!
head(gss_cat1)  
str(gss_cat1)

# if() statement
  # The if() statement allows us control which statements are executed. 
    # if (condition/logical expression) {commands when condition TRUE }
    # else      {commands when condition FALSE}
x <- 4
if(x<0) {print("negative")} else {print("non-negative")}
x <- -2
if(x < 0){print("negative")} else {print("non-negative")}
x <- c("female", "male")
if(is.numeric(x)) {print("numeric vector")} else {"non-numeric vector"}
y <- 1:5 
if(is.numeric(y)) {print("numeric vector")} else {"non-numeric vector"}

# multi-conditionals 
  # AND operator 
x <- 10 
if(x > 5 & x < 15 ) {
  print ("x is between 5 and 15")
}
x <- 3 
if(x > 5 & x< 15) {
  print("x is between 5 and 15")
} #Signs because this condition is not true and it is in fact false, it will not execute anything
  
  # OR operator 
x <- 5 
if (x > 3 | x== 1) {
  print (" x is greater than 3 or equal to 1")
}
x <-2 
if ( x > 3 | x == 1) {
  cat("x is greater than 3 or equal to 1")
} # condition is FALSE, nothing is executed 

  # NOT operator 
if(!FALSE){ # remember that ! means "not" 
  print ("this statement will show up")
}
x <- 2 
if (x >3 | x == 1){
  print ("x is greater than 3 or equal to 1")
} else if (!FALSE){
  print("x is neither greater than 3 nor equal to 1")
}
x <- 2
if(x > 3 | x ==  1) {
  print("x is greater than 3 or equal to 1")
} else {
  print("x is neither greater than 3 nor equal to 1")}

# nested if else statement 
# if (test_expression1) {
#    statement1
# } else if ( test_expression2) {
#    statement2
# } else if ( test_expression3) {
#    statement3
# } else
#    statement4
x <- -3 
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else {
  print("Zero")
}
x <- 5
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else {
  print("Zero")
}
x <-0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else {
  print("Zero")
} 

# Try this: Print the letter grade for a student in QTM 150!  ????
    # A if grade >= 90, B if 80 <= grade< 90, C if 70 <= grade <80, D if less than 70
grade <- rnorm(1,80, 5)
?rnorm() # The normal distribution rnorm (n, mean=0, sd= 1)
grade
if (grade > 90 | grade== 90) {
  print ("A")
} else if (grade > 80 | grade== 80 | grade < 90){
  print("B")
} else if (grade > 70 | grade== 70 | grade < 80) {
  print("C")
}else {
  print("D") #This sorta works check with someone else
}

# for loop 
  # Control how many times statements are repeated 
  # If we want to run the same block of code multiple times. The for() statement allows one to specify that a certain operation should be repeated a fixed number of times. 
    # iterate n times over an index

  # Example 1: Print the squared values of 1 ~ 10
n <- 10 
n
for(i in 1:n){ # think of i as a new varible for the print version.
  print(i^2)
}
?for (variable in vector) { # wait this is crazy, did it just print out a template for me? 
}
# also can do...
x <- 1:10
for(i in x){ # the only different was the ":" before and after
  print(i^2)
}

    # a MAJOR issue is that we can only PRINT it. notice [1] in each line of output.
    # Instead, assign the loop output into a NEW vector called "squared_values"
squared_values <- rep(0,10) # create an empty numeric vector with 10 elements
squared_values #repeated 0 10times
for(i in 1:n){ # n still is n <- 10 
  squared_values[i] <-  i^2 # why is it that when I change it to a different letter than i then it doesn't show 
}
squared_values
  #another method... Example 2: 1 + 2 + 3 +... + 10 = ? 
n <- 10
x <- 0 # initial value 
for(i in 1:n){
  x <- x + i # first 0+1, 1+2, 3+3, 6+4, 10+5..
}
x  

  # Example 2: adding stuff to a vector 
random_numbers <- NULL #create a vector with no elements 
random_numbers #shows nothing 
for(i in 1:10){
  random_numbers <- c(random_numbers, runif (1, 1, 5)) # picks one random number from 1 to 5 
}
print(random_numbers) # random_numbers now has 10 random numbers between 1 and 5 

#iterate over all items in a vector 
  # initial value 
  # vector 
  # for (name in vector) {commands}

  # Example: In R we have some US state facts and figures, 
state.name
state.name[substr(state.name, 1, 1)=="N"] #print names of states starting with 
Nstates <- NULL
for(i in state.name){ # character
  if(substr(i, 1, 1)=="N"){
    Nstates <- c(Nstates, i)
  }
}
Nstates
?substr # substr(x, start, stop)

  # To take substrings for a vector of character strings x, use substr(x, start, stop), start and stp say which characters to keep. 
  # Exercise: Central limit theorem 
pop <- na.omit(gss_cat$tvhours)
hist(pop)
?na.omit # generic functions to deal with NAs, basically returns the object with incomplete cases removed 

size <- 10 # sample size: # of obs 
N <- 200 # how many sample means 
x <- numeric (N)
?numeric # just prints the desire length, in zeros? 
x
# you can also do...
x <- vector("double", N) #wait why double
? vector # produces a simple list almost
x
for(i in 1:N){
  x[i] <- mean(sample(pop, size))
}
hist(x)
x

# increasing sample size 
size <- 200 #sample size increased 
N <- 200 #how many sample means 
x <-numeric(N)
for(i in 1:N) {
  x[i] <- mean(sample(pop,size))
}
hist(x)
# or 
# replicate(# of repetition, expression)
hist(replicate(N, mean(sample(pop, size))))



  # Practice: get the average grades for each student
# Toy data
set.seed(1111)
exams <- list(
  student1 = round(runif(10, 50, 100)), #10 random numbers chosen from 50 to 100
  student2 = round(runif(10, 50, 100)),
  student3 = round(runif(10, 50, 100)),
  student4 = round(runif(10, 50, 100)),
  student5 = round(runif(10, 50, 100))
)
exams

# mean(exams) does NOT work because exams is NOT a numeric vector
class(exams)

# Quick review on lists: Store arbitrary collections of different type of vectors. (list is different from data frame, data frame stores different vectors with the same length like spreadsheet)
a_list <- list(num = c(8, 9), 
               log = TRUE,    
               cha = c("a", "b", "c"))
a_list

#how to index elements from a list
a_list$num 
a_list[["num"]] 
a_list[[1]]
a_list[[1]][2] #print just the second element of the first list

# The above are three subsetting commands. Do they return the same values? Run the code chunk above, and then run the code chunks below to confirm.
vec <- c(-2, -1, 0, 1, 2)
abs(vec) #absolute values

lst <- list(-2, -1, 0, 1, 2)
abs(lst)
#abs(lst) # does not work on list

# What we can do instead…
list(student1 = mean(exams$student1),
     student2 = mean(exams$student2),
     student3 = mean(exams$student3),
     student4 = mean(exams$student4),
     student5 = mean(exams$student5))

# Question: What if I have 100 students?
  # Answer: Use for loop

x<-vector("double",length(exams)) 
x
for (i in 1:length(exams)) {
  x[i]<-mean(exams[[i]])
}

#alternatively,
for (i in seq_along(exams)) {
  x[i]<-mean(exams[[i]])
}
x

# or use Xapply() function
  # remember tapply()? Use similar functions 
lapply(exams, mean) # apply fun to a list, return a list
sapply(exams, mean) # return a vector

a <- sapply(exams, mean) # return a vector
a[1]

# There is a package called purrr, make the iteration easier. We will talk about it very soon.





# Begin Assignment Practice 
# (4pts). Print the letter grade for 100 students in a class!
  # First, create a vector called grade which consists of 100 randomly selected scores from a normal distribution with a mean of 80 and a standard deviation of 7.
grades <- rnorm(100,80, 7)
grades
#Then, assign a letter grade to each student using the following conditions:
  # A if 90 or better,
  # B if greater than or equal to 80 and less than 90,
  # C if greater than or equal to 70 and less than 80,
  # D if less than 70.
for (i in 1:length(grades)){
  if (grades[i] >= 90) {
    print("A")
}   else if (grades[i] >= 80){
    print("B")
}   else if (grades[i] >= 70){
    print("C")
}   else {
  print ("D")
}
}
# (4pts). Write a for loop using the mtcars dataset.
   
   # a. Compute the mean of every column,
mtcars1 <- vector("double", ncol(mtcars))
N <- ncol(mtcars)
for (i in 1:N) {
  mtcars1[i] <- mean(mtcars[[i]], na.rm=TRUE)
}
mtcars1

  # b. Compute the median of every column,
mtcars3 <- vector("double", ncol(mtcars))
for (i in 1:N) {
  mtcars3[i] <- median(mtcars[[i]], na.rm=TRUE)
}
mtcars3
    
  # c. Assigning the values of all means and medians computed in Steps A and B into a list call mtcars1. In other words, mtcars1 should be a list containing 2 items: "means" and "medians".
mtcars_list1 <- list("mean"= mtcars1,
                    "median"= mtcars3)
mtcars_list1

# (2pt). Using Xapply(), create a numeric vector called mtcars2 which includes two cases: the maximum value of "means" and the maximum value of "medians."
class(mtcars_list1)
mtcars3 <- sapply(mtcars_list1, max) 
mtcars3




# ANOTHER WAY TO DO PROBLEM 2! 
mtcars_betterway <- list()
for (i in 1:length(mtcars)) {
  mtcars_betterway[["mean"]][i] <- sapply(mtcars[i], mean)
  mtcars_betterway[["median"]][i] <-sapply(mtcars[i], median)
}
mtcars_betterway


#QUIZ HELP 
library(dplyr)
library(lubridate)
library(forcats)
library(babynames)
library(tidyverse)
library(ggplot2)
library(nycflights13)
# Class(_____) #tells you if its a numeric or character 
# ____ <- ifelse(testexpression, yes, no)
# ____ <- runif(n, parameters of distribution, the end of the parameter )
# if (condition/logical expression) {commands when condition TRUE}
# else           {commands when condition FALSE}


str(mtcars)
mtcars1 <- vector("double", ncol(mtcars))
N <- ncol(mtcars)
for (i in 1:N) {
  mtcars1[i] <- avg(mtcars[[i]], na.rm=TRUE)
}
mtcars1

