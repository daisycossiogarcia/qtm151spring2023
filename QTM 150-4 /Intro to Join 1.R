# In Class Notes 10/20/2022: Intro to Join part 1 
installed.packages("nycflights13")
library(nycflights13)
# for paknes, each tailnum only has one oversercation (tailnum is the primary key variable in planes)
# planes %>%
#grou_by(tailnum) %>%
# not finished 

##atlernatively , 
# planes %>%
#count(tailnum)
#filter (n>1) 

## tailnum is the foreign key in flights (uniquely an observation in another table)
# flights%>%
# count (tailnum) %>%
# filter (n>1) %>%
# arrange(desc(n))

##Examining weather dataset 
# str(weather)
# summary(weather$year) #only year 2013
# table(weather$orgin) # all 3 airports are included 

## print only the ones with more than 1 observation 
#weather %>%
# count(year, month, day) %>%
#filter (n>1)

## how mnay flights per each origin at the same hour? 
# flights 

## tibble/tribble is a trimmed down version of data.frame(), they are several good features bout triblle, 
##the fucntion tribb;e () is used to create a small data set 
# band <- tribble( 
# ~name, ~bond,
#"John", "Beatles",
# "Paul", "Beatles" 
#)
# band 
#instrument <- tribble(
# ~name, ~plays, 
#"John", "guitar", 
# "Paul", "bass",
# keith", "guitar" 
#)
#intstrument 

##let's join datasets 
## XXX_ join (x,y, by="key varibale")
## join y to x, x is the pirmary data set 
#mutate new variables in x by coping different variables in y 
##return a new data set 

# Join, part 1 
    # It’s rare that a data analysis involves only a single table of data. Typically, you have many tables of data (in a
    # database, similar to SQL), and you must combine them to answer the questions that you’re interested in.
    # Multiple tables of data are called relational data because it is the relations (with common variables).
install.packages("nycflights13")
library(nycflights13)
library(dplyr)
str("nycflights13")
    # nycflights13 contains four data tables that are related to the main flights table:
    # This diagram can be a little overwhelming, but it’s important to understand how the data tables are connected with each other.
?nycflights13::flights # this will bring up a Help page on flights data
str(flights) #the structure of the flights table
    # airlines lets you look up the full carrier name from its abbreviated code: 
flights[,10:18] # looks at the variables as they are the y value. 
airlines # through the *carrier* variable, remember that the airlines contains both carrier and name
    # planes gives information about each plane, identified by its tailnum: 
planes # via the *tailnum* variable
    #airports gives information about each airport, identified by the faa airport code (the same value as the *origin* or *dest* variables in the flights data)
airports # via two variables *dest* = *faa*
    # weather gives the weather at each NYC airport for each hour:
weather # via *origin*, *year*, *month*, *day*, and *hour*
   
    # The variables used to connect each pair of tables are called keys. A key is a variable (or set of variables) that uniquely identifies an observation.
    # primary key variable uniquely identify each observation
    # for planes, each tailnum only has one observation (tailnum is the primary key variable in planes)
planes %>% #chosing data
  group_by(tailnum) %>% # split the data frame into pieces based on tailnum
  summarize(total=n()) %>% # condense multiple values to a single value
  filter(total > 1) # Only wanting to look at total tailnum greater than 1
    # This is the same as.... 
planes %>%
  count(tailnum) %>% 
  filter(n>1 )

    # tailnum is the foreign key in flights (uniquely identifies an observation in another table)
flights %>%
  count(tailnum) %>%
  filter(n>1) #n() is to calculate the number of occurrences of each observation, basically the amount of times this specific plane went to flight
    # count() is to calculate the number of occurrences of each observation, the same as the below group_by()+summarize(n())
    # difference among sum(values in the variable), n(no argument needed), and count(the dataset, by the variable)
x<-c(1:5)
sum(x)
weather %>%
  count(year, month, day, hour, origin ) %>%
  filter(n>1)
flights %>%
  count(year, month, day, flight,sort=T) %>%
  filter(n>1)

    #join 
    # tibble/tribble is a trimmed down version of data.frame(), they are several good features about tribble,   
    # the function tribble() is used to create a small data set
band <- tribble( 
  ~name, ~band,
  "Mick", "Stones",
  "John", "Beatles",
  "Paul", "Beatles"
  )

instrument <- tribble(
  ~name,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)
instrument1 <- tribble(
  ~artist,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)

    # Mutating Joins 
    # XXX_join(x, y, by=“key variable”)
    # join y to x, x is the primary data set
    # mutate new variables in x by copying different variables in y
    # return a new data set
    # XXX_join(x, y, by=c(“key variable1”, “key variable2”)): A key is a variable that uniquely identifies an observation, 
    # otherwise, we need multiple variables to identify an observation

# 1. left_join(x, y, by=“key variable”): keeps all the observations (rows) in x
data1<-left_join(band, instrument, by="name")
data1

# 2. right_join(x, y, by=“key”): keep all the observations (rows) in y
data2<-right_join(band, instrument, by="name")
data2

# Example 1:Make data be the same as data1 with the right_join():
data1<-left_join(band, instrument, by="name")
data1
data<-right_join(instrument, band, by="name")
data  
setequal(data1,data) # check whether two data sets are the same 

# 3. inner_join() keeps all the observations in both x and y
    # An inner join keeps observations that appear in both tables. But unmatched rows are not included in the result, it is easy to lose observations.
inner_join(band, instrument, by= "name") 

# 4.full join keeps all observations in x and y
    # An full join keeps observations that appear in either x or y.
full_join(band, instrument, by="name")


# Personal practice 

tibble(
  x= 1:5, 
  y= 1, 
  z= x^2 +y
) # Intersting you can also type it this way with the letter on the top and the values on the side 

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
  ) #interesting probably won't be doing this 
tb

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

#Extra Notes about ncyflights13
  # airlines lets you look up the full carrier name from its abbreviated code:
  # airports gives information about each airport, identified by the faa airport code:
  # planes gives information about each plane, identified by its tailnum:
  # weather gives the weather at each NYC airport for each hour:

#Exercise: Imagine you wanted to draw (approximately) the route each plane flies from its origin to its destination. What variables would you need? What tables would you need to combine?
# You need flights and airports table, flights= origin, dest and airport= lon, lat
#




