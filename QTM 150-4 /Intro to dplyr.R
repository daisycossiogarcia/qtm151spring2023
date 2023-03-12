#Intro to dplyr 

# dplyr is a popular (and powerful) package allowing users to easily manipulate data frames in R.
# It is also often used with the ggplot2 package to allow us to clean, manipulate, and visualize any data sets.

installed.packages("dplry")
install.packages("dplry")
library(dplry)
installed.packages("dplyr")
install.packages("dplyr")
library(dplyr)
# ^ Reinstall everything like ggplot2, had to try it twice 

# split-apply-combine: A common analytical pattern is to split data frame into pieces, 
# apply some function to each pieces, then combine the results back together again into a new data frame.
# The dplyr package provides simple verbs, functions that correspond to the
# most common data manipulation tasks, to help you translate your thoughts into code.

# filter() to select cases based on their values.
# arrange() to give cases/observations a specific order.
# select() to select variables based on their names.
# mutate() to add new variables that are functions of existing variables.
# summarize() to condense multiple values to a single value.
# group_by() to split the data frame into pieces based on some variables.

# Note that ALL 6 verbs listed above work in a similar way:
# 1. The first argument is a data frame.
# 2. The subsequent arguments describe what to do with the data frame, using the variable names (without quotes).
# 3. The result is a new data frame.

# Import dataset 
gss <- read.csv("newgss2.csv") # New data yay 

# filter(): Select cases/observations/rows based on their values. filter() works on observations/rows 
summary(gss)
filter(gss, year==2000) # Selects all the respondents in 2000
filter(gss, year==2000, sex=="FEMALE")
datal <- filter (gss, year==2000, sex=="FEMALE")
filter(gss, happy=="NOT TOO HAPPY", marital=="MARRIED")
filter(gss, happy=="NOT TOO HAPPY", marital== "MARRIED", year== 1973)
filter(gss, happy=="NOT TOO HAPPY", marital== "MARRIED", year==1973, sex=="MALE")
# Notice that dplyr executes the filtering operator and return a new data frame, you can save the new data frame to an object. 

# arrage(): Reorder the observations by their values of a variable.arrange() works on observations/rows. 
# arrange(dataset, variable)
arrange(gss, age) # ascending order is default
arrange (gss, desc(age))

# select(): Select variables based on their names.select() works on variables/columns. 
select(gss, year, age, income1, happy, degree, marital, health)
data2 <- select(gss, year, age, income1, happy, degree, marital, health)

# mutate(): Create a new columns that are functions of existing columns and add them to the original dataset as a new dataset. mutate() works on variables/ columns 
mutate(data2, income2= income1/ age)

# summarize(): Get grouped summaries from multiple values
summarize(gss, avg=mean(age,na.rm=T))

# Combine multiple verbs together using the pop operator %>% (then). 
# Pipes take the output from one function and feed it to the first argument of the next function. 
# The idea of the piping is to read the functions from left to righ 
gss %>%
  select(year,income1, age, sex) %>%
  filter(year==2000, sex=="MALE") %>% 
  arrange(age) %>%
  mutate(income2= income1/age)

# Pair summarize() with group_by()
# Split the data fram into pieces based on some variables. 
# split-apply-combine: split data frame into groups, apply some function to each group, and combine the results back together again to a new data frame 
gss %>%
  group_by(year) %>%
  summarize(avg= mean(age, na.rm=T))

str(gss)
dim(gss)
summary(gss)
?filter

ATL_NYC_PRACTICE <- ATL2020 %>%
  filter 
