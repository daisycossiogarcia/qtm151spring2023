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
# if (test_expression1) {
#    statement1
# } else if ( test_expression2) {
#    statement2
# } else if ( test_expression3) {
#    statement3
# } else
#    statement4
#for (i in vector) {}

# BE CARE WITH PUTTING STUFF IN LIST OR VECTOR 
# This would produce a list >>> x <- 1:10
                                #for(i in x){
                                # print(i^2)
                              #   }

# This would produce a vector >>> squared_values <- rep(0,10) #create an empty numeric vector with 10 elements
                                  # squared_values
                                #for(i in 1:n){
                                # squared_values[i] <- i^2
                                #}
                                # squared_values
# replicate(# of repetition, expression)
# a_list[[1]][2] #print just the second element of the first list
# lapply(data, numeric) # apply fun to a list, return a list
# sapply(data, numeric) # return a vector
# a <- sapply(exams, mean) # return a vector
# a[1]


# Write a for loop which calculates an average for all the values in each column of mtcars. Then, assign them into a vector called avg. What is the median of avg?

str(mtcars)
mtcars1 <- vector("double", ncol(mtcars))
N <- ncol(mtcars)
for (i in 1:N) {
  mtcars1[i] <- avg(mtcars[[i]], na.rm=TRUE)
}
mtcars1

mtcars_avg <- list()
for (i in 1:length(mtcars)) {
  mtcars_betterway[["avg"]][i] <- sapply(mtcars[i], avg)
mtcars_avg
?avg

# Write a for loop using if() to create a new variable within mtcars dataset called mtcars$hp_cat based on mtcars$hp variable. Make sure mtcars$hp_cat consists of the following 3 categories:

If less than 95, "slow"

if greater than or equal to 95 and less than 180, "average"

finally, if greater than or equal to 180, "fast"

for (i in 1:length(mtcars$hp_cat)){
  if (grades[i] >= 180) {
    print("slow")
  }   else if (grades[i] >= 95){
    print("average")
  }   else {
    print ("slow")
  }
}

