# Function and Purrr Practice 
  # Function 
    # We have been using many functions in R, now we learn to write them ourselves.

# Example functions we've been using... 
sample(1:10,5,replace=T)
hist(1:10)

# Basic structure 
  # name <- function (Input)
  # {
  #   Body 
  #   output value 
  # }

  # name <- function (Input1, Input2,...) 
  # {
  #   Body 
  #   return (list = c(output1, output2,...))
  # }

  ## use the function we made by calling the name 
  # name (Input1, Input2,...)

# Example 1: create a mean function called avg: 
avg <- function(x) { # x is a numeric vector 
  sum(x)/length(x)
}
x <- 1:5
avg(x)
mean(x) #existing funciton gives you the same result
avg(1:5) # same result

# alternatively, 
avg2 <- function(x) {
  a <- sum(x)/length(x)
  return(a)
}
avg2(c(1:10))
avg(c(1:10))# no difference in ouput !

  # Try this: Create a standard deviation function. 

# Functions can be declared and used inside a function. Functions in R can also return function. 
  # Example 2: create a mean function including missing value 
    # avg(c(1:5, NA), na.rm=T) this doesn't work because the avg function only takes 1 input x 
meanNA <- function(x, na.rm){ #x and na.rm as input 
  if (na.rm) x <- na.omit(x) # if true, omit NAs from x 
  return(sum(x)/length(x))
}
meanNA(c(1:5, NA), na.rm=T)
mean(c(1:5, NA), na.rm=T) #same result
?mean # see that na.rm is listed in the arguments 
  # Example 3: get some summaries of a numeric vector 
nums10 <-rnorm(10,80,5) # 10 random numbers from a normal distribution with mean of 80 and stf of 5 
?rnorm() # to learn more about it 
nums10
summary(nums10) # returns 5-number summary
  # Let's create our own summary 
mysum <-function(x){
  return(list=c(min=min(x), max=max(x), sum=sum(x), mean=mean(x), n=length(x))) # for multiple return, use list= c(output1, output2...)
}
  #run the function 
mysum(nums10)
  # Example 4: make a function to calculate the range: 
  myrange <- function(x) {
    max(x)- min(x)
  }
myrange(nums10) 
mysum(nums10) #check!
  # Try this. make a funtion to calculate the IQR (Q3-Q1)
  # Example 5: make a rescale function: rescale all the numbers in a vector to [0,1]
rescale1 <- function(x){
  (x-min(x)/max(x)-min(x))
}
v <- runif(10,1,5) #this time, 10 random numbers from uniform dist from 1 to 5. 
v
summary(v)
  #what happens after rescaling
w <- rescale1(v)
w
summary(w) # all between 0 and 1 
  # Example : Plot a function 
  # convert Celsius to Fahrenheit 
CtoF <-function (x){
  y <- 1.8*x +32 
}
CtoF(seq(0,100)) # converts C to F then plot 
x <- 0:100
plot(x, CtoF(x))
  #another example 
fun2 <- function(x) {
  x^2
}
fun2(w)
w^2 #I know we can just do this instead, of course...
fun3 <- function(x){
  x^3
}
?curve() # use curve() function to quickly create a curve 
curve(fun2,-1,1)
curve(fun3, -1,1)

  # OR use ggplot! 
library(ggplot2)
ggplot(data=data.frame(a=c(-1,1)), aes(x=a))+
  stat_function(fun=fun2)+ 
  xlim(c(-1,1))
ggplot(data=data.frame(a=-1:1), aes(x=a))+
  stat_function(fun=fun3)+
  xlim(c(-1,1))
ggplot(data=data.frame(c=seq(0,100)), aes(x=c))+
  stat_function(fun=CtoF)
  
  # Example 7: Plot a user-defined function 
curve(fun3(x), from=-1, to = 1)
curve(fun2(x), from= -1, to =1)
curve(fun3(x), from = -1, to = 1)
curve(fun2(x), add=TRUE, col="red") # Add a line:
ggplot(data=data.frame(a=-1:1), aes (x=a))+ 
    stat_function(fun=fun2, col="red")+
    stat_function(fun=fun3, col="blue")
  # This is much better in ggplot! 

  # Example 8: Create a function to print all the summaries 
super_sums <- function(vector){
  print(length(vector))
  print(summary(vector))
  print(mean(vector,na.rm = T))
  print(sd(vector,na.rm=T))
  print(quantile(vector))
  par(mfrow=c(1,2))
  hist(vector)
  boxplot(vector)
}
x <- rnorm(100,0,1)
super_sums(x)

  # Purrr
    # The goal is to break common list manipulation challenges into independ pieces: 
  #map() function for each type of output: 
    # map() make a list.
    # map_lgl() makes a logical vector.
    # map_int() makes an integer vector.
    # map_dbl() makes a double vector.
    # map_chr() makes a character vector.
      # Each function takes a vector/list as input, applies a function to each piece, and then returns a new vector/list that’s the same length.
  # Example: Let's start with some toy data representing exam scores for 5 students 
    # Toy data
    # rXXX(size, parameters of this distribution) to create random numbers from a specific probability distribution 
install.packages("Purr")
library(purrr)
set.seed(1000)
exams <- list(
  student1= round(runif(10,50,100)),
  student2= round(runif(10,50,100)),
  student3= round(runif(10,50,100)),
  student4= round(runif(10,50,100)),
  student5= round(runif(10,50,100))
)
exams  
  # we can make a fucntion called collection_mean() to calculate many students' average exam scores. 
collection_mean <- function(list){
  output <- vector ("double", length(list)) # double is a numeric vector the same length of the input (list)
  for(i in seq_along(list)){ #seq_along() is to get index of elements of the list, 1: length(list) works as well 
    output[i] <- mean(list[[i]])
  }
  output
}
collection_mean(exams)
  # map (vector/list, function)
map(exams, mean) # map the mean function to each element, and then returns the output as a list
map_dbl(exams, mean) # returns a vector instead
  # Calculate the standard deviation(sd()) of each student exam grades.
map(exams, sd)
map_dbl(exams,sd)
  # alternatively, With purrr, you get lots of small pieces that you can compose together with pipes, %>%. 
exams %>%
  map(sd)
exams %>%
  map_dbl(sd)
  ## remember that you can also use these...
lapply(exams, sd)
sapply(exams, sd)

  # Try this: Recalculating the final grade by adding extra credit 
  # 1. Calculate the maximum grade for each student. Return the result as a vector. 
exams %>%
  map_dbl(max) # double vector, numeric vector 
  # 2. Calculate the range for each student. Return the result as a vector. 
myrange <- function(x){ #create a function called myrange()
  max(x)-min(x)
}
exams %>% #maps range() on exams and return the result in a vector. 
  map_dbl(myrange)
  # 3. Compute a final grade for each student, where the final grade is the average exam score plus any extra_credit assigned to the student. Return the results as a double (i.e. numeric) vector.
extra_credit <- list(0,0,10,10,15)
  # start by creating a function 
finalgrade <- function(x,y){
  mean(x)+y
}
  # map2 works on two lists 
map2(exams, extra_credit, finalgrade) # returns a list 
map2_dbl(exams, extra_credit, finalgrade) # returns a vector 
  #alternatively, 
exams %>%
  map(mean) %>%
  map2_dbl(extra_credit,sum)
  # If you want to do this without creating a new function, try the following: 
exams %>%
  map2_dbl(extra_credit, function(x,y) mean(x)+y) #this is the best! 
  # exams passes to the first argument of map2_dbl()
  # 4. TRY THIS! Calculate the final grade for all students by counting their maximum score twice AND adding the extra credits! 
#___________________________________________________

  # map() works on datasets
  # Example: Compute the mean of every column in mtcars 
mtcars
map(mtcars,mean)
map(mtcars, ~ mean(.)) # generalize solution with map() function 
  # Example: fit the linear model for each piece of data. 
mtcars %>%
  split(.$cyl) %>%
  map(function(df) lm(mpg~wt, data= df))
  # shortcut
mtcars %>%
  split(.$cyl) %>%
  map(~lm(mpg~wt, data=.))
mtcars %>% 
  split(.$cyl) %>%
  map(~ggplot(.,aes(x=wt, y=mpg))+geom_point())
  #alternatively, you can use ggplot
ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  facet_wrap(~factor(cyl))
  # Example: Compute the number of unique values in each column:
str(iris)
head(iris)
  #how much unique observations are present for each variable?
map(iris, ~ length(unique(.x)))
  # Example: Fix the missing values:
df<- tibble(
  a= c(rnorm(9), -99),
  b<-c(-999, -99, rnorm(8))
)
df
fix_missing <- function(x) {
  x[x<= -99] <- NA
  x
}
map(df, fix_missing)

# I do not understand any of these last things on purrr

