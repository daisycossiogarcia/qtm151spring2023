# Assignment 4 
# Setting my boundaries 
installed.packages("ggplot2") # Installed the package 
install.packages("ggthemes") # Another installed package 
library(ggplot2) # Check out the data set and the variables
library(ggthemes) # Check out the data set and the variables 
str(txhousing) # More info about the variables, characterist, number, and some of the options 

# 1 Exactly how many cities are included in this dataset?
# Create a new variable that factors the $city variable 
# Find the number of levels, which in this case is the number of cities 
table(txhousing$city) # I just physically counted them 
#Total of 46
city <- factor(txhousing$city) #just label cities into a focused factor 
levels(city) #Listed them all in numeric order 
# Again the total is 46 of number of cities in this data set 

#2 Create a subset of txhousing which includes any 4 cities. 
# We decided to make a subset of the data set using only Dallas, Houston, El Paso, and Austin and then check it 
txhousingnew <- subset(txhousing,c (txhousing$city== "Houston" | txhousing$city== "Dallas" | txhousing$city== "Austin" | txhousing$city== "El Paso"))
table(txhousingnew$city) # This is to just show we do have these four cities marked in this subset 

#3 produce an appropriate plot showing how well "year" predicts the outcome of the "median" housing prices. Also, describe in your own words a general pattern you see between "year" and "median".
# Make a plot that graphs median sale price of houses over year that also distinguishes 
# between each city on the plot 
# In addition add a line, and label the graph 
ggplot(txhousingnew,aes(x=year, y=median))+ geom_point(aes(color=city))+ geom_smooth(color="black", method= "lm")+ labs(x="Year", y= "Median Sale Price of House ($)", title="Median Sale Price of House by Year")
# The general pattern seen here is that there is an increase of, Median Sale Price of House for each Year, positve correlation. 

#4 Note that each "year" shows multiple observations of "median". Other than the "city" variable, which other variable is responsible for showing multiple observations of "median" for each year on the plot you created in Question 3?
# Use the table function in order to see the number of month observations by year 
table(txhousingnew$year, txhousingnew$month)
# Since there are multiple month observations for each year that causes for there to be multiple median observations for each year 

#5 Reorganize the plot produced in Question 3 by "city" such that your original plot is now broken into a total of 4 subplots, each one representing the relationship between "year" and "median" for each "city". 
# Use the graph from question 3 but add the facet_wrap function in order to split the plot into 4 subplots by city 
ggplot(txhousingnew,aes(x=year, y=median))+ geom_point (aes(color=city))+ geom_smooth(color="black", method="lm")+ facet_wrap(~city)+ labs(x="Year", y="Median Sale Price of House ($)", title= "Median Sale Price of House by Year")

#6 Which city shows the highest overall "median" housing prices? Which city shows the lowest overall "median" prices? Then, create a subset including only these two cities.
#Use the tapply function in order to find the highest $median for each $city 
tapply(txhousingnew$median, txhousingnew$city, summary)
# The cities with the highest overall median is Austin, and El Paso
# make a new subset with just Austin and El Paso 
txhousing2 <- subset(txhousingnew, c(txhousingnew$city== "El Paso" | txhousingnew$city=="Austin"))

#7 Produce a SINGLE plot displaying the relationship between "year" and "median" for these two cities. Be sure to label the axes and the title, and use a different color for each city. Your plot should also show two trend lines, one for each city.
# Make a plot that graphs median sale price of houses over years with the txhousing2 subset,
# that also distinguishes between each city, and label the graph 
# In addition add a line for each city, and lavel the graph 
ggplot(txhousing2, aes(x=year, y=median, color=city))+ geom_point()+ geom_smooth(method="lm")+ labs(x="Year", y= "Median Sale Price of House ($)", title= "Median Sale Price of House by Year")

#8 Is there anything else that needs to be done to improve the plot (hint: Think about your response to Question 4). Generate a new plot and describe what you did to make your plot more clear.
# It would be helpful to divide the plot into subplots by month 
# Use the graph from question 7 but add the facet_wrap function in order to split the 
#plot into 12 subplots by month 
ggplot(txhousing2,aes(x=year, y=median, color=city))+ geom_point()+ geom_smooth(method="lm")+ facet_wrap(~month)+ labs(x="Year", y= "Median Sale Price of House ($)" , title= "Median Sale Price of House by Year")
# By doing this, each graph will have only one data point for each city in a singular 
# Year, in addition it can be seen how the Median Sale Price of House ($) changes for every month over the years 

#9  Finally, using plain English, describe the similarities and differences between your chosen two cities.
# Although the overall median sale prices is lower for El paso both cities show the same overall trend of 
#increasing over the years. 