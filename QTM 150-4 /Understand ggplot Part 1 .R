# QTM 150: ggplot2, Part 1 

# In this lab we will go over how to visualize your data using ggplot2. R has 
# several systems for making graphs, but ggplot2 is one of the most elegant and 
# most versatile. ggplot2 implements the grammar of graphics, a coherent system 
#for describing the building graphs

# First, install both *ggplot2* and *ggthemes* packages by executing the following lines of code:
install.packages("ggplot2")
install.packages("ggthemes")
# Then, load both packages by executing the following lines of code:
library(ggplot2)
library(ggthemes)
?diamonds # diamonds is a data set included in the ggplot2 package. learn about this data set.
str(diamonds) # summaries for each variable 
?mpg #mpg is another data set included in the ggplot2 package. learn about this data set.
str(mpg) #summaries for each variable 

# Basic ggplot using diamonds data set 
ggplot(diamonds) # You get just a plain grey box 
ggplot(diamonds, aes(x=carat, y=price)) #This will add coordinates, labeling the axis
ggplot(diamonds, aes(x=carat, y=price))+ geom_point() #Will add points 
ggplot(diamonds, aes(x=carat, y=price))+ geom_point()+ labs(x="Carat", y="Price", title="Figure 1:diamonds price by carat")+ theme_bw() #Adds labels and theme 
graph1 <- ggplot(diamonds, aes(x=carat, y=price))+ geom_point()+ labs(x="Carat", y="Price", title="Figure 1:diamonds price by carat") #save graph to an object 
# other package give more themes to use ggthemes 
graph1+theme_wsj() #Washington Street Journal Theme
graph1+theme_economist() # Economist theme 
graph1+ theme_stata() # Statistics theme

# Working with plots: Changing size, shape, alpha using ggplot 2 
ggplot(diamonds,aes(x=carat, y=price))+ geom_point (size=4) #Changing size
ggplot(diamonds, aes(x=carat, y=price))+ geom_point(shape=4) #Changing shape 
ggplot(diamonds, aes (x=carat, y=price))+ geom_point (alpha=0.1) #Alpha transparency

#Changing color: Three ways 
# The first way:enter the color name (google ggplot color)
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(alpha=0.2, size= 3, shape=6, color= "red")+ geom_smooth (color="blue", method="lm")+ labs(x="Carat", y="Price", title= "Figure 1: diamonds price by carat")+ theme_bw() #Makes a ful type of graph 
#colors()
#The second way, to combine color
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(alpha=0.2, size= 3, shape=6, color= rgb(0.5, 0.7, 0.2))+ labs(x="Carat", y="Price", title= "Figure 1: diamonds price by carat")+ theme_bw()
# The third way Hex color codes 
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(alpha=0.2, size= 3, shape=6, color= "#4F2E84")+ labs(x="Carat", y="Price", title= "Figure 1: diamonds price by carat")+ theme_minimal()
# google hex color code 

#Now, try the following example: 
#Example 1: Use the mpg dataset to make a scatterplot of citympg and highway mpg (two quan variables; numeric vectors). change axes labels and give your plot a title. change the points to dark blue triangle, change size to 6, and opacity to 0.3
# Why are some triangles darker than others? We can introduce random variables in our data usig the jitter command to reveal overlapping data points: geom_point(…, position=‘jitter’,…)

# Assigning variables to aesthetic attributes 
#Size 
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(aes(size=carat))+ scale_size(name= "Title", range=c(1,5))+ labs(x="carat", y="price", title= "diamonds price by carat") # This controls sorta the "key of the datatset" 
# Shape 
is.factor(diamonds$cut)
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(aes(shape=cut), color="blue")+ labs(x="carat", y="price", title= "diamonds price by carat")+ scale_shape(name="Cut Scale") # Another way to have a legend and assign different stuff with different shapes 
# Alpha 
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(aes(alpha=price), color="blue", position='jitter')+ scale_alpha(name="Price") #Uses transparency, the high the number the more bold it is 
#Putting it all together 
ggplot(diamonds, aes (x=carat, y=price))+ geom_point(aes(size=carat, shape=cut, alpha=price, color="blue" ))
# You should size for numerical and shape for categorical 

#Assign variable to color 
#For continuous numerical variable (i.e., numeric vector)
ggplot(diamonds, aes(x=carat, y=price))+ geom_point(aes(color=price)) #sorta like a gradient 
ggplot(diamonds, aes(x=carat, y=price))+ geom_point(aes(color=price))+ scale_color_gradient(name="Price", low="darkblue", high="orange")
# For categorical variables (i.e., factors), using mpg now 
ggplot(mpg, aes(x=cty, y=hwy))+ geom_point(aes(shape=factor(year), color=factor(cyl)))
