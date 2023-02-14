# %%
print ("Daisy Cossio Garcia")
# Notes for Quiz 1 (Fill in the Blanks)

############# LECTURE 1 ##################
# To import something 
## import -insert package name here- as -insert nickname here-

# To open datasets
## -insert nickname- = -insert package (usually pandas)-.read_csv('insert folder of data/ name of data')

# To find datasets in a table
## Go to the variable tab and click on data in search box
## If you want to find it then just type in the nickname 

# Find a single column 
## -insert nickname- ['column name']

# Compute a frequency table 
## -insert packages-.crosstab(index= -insert nickname ['column name'], columns= 'insert custom title')

# Compute the count, mean, std, miin, 25% quantile
## -nickname-.describe()

# Get a scatter plot 
## -insert matplot.ply-.scatter(x=-nickname-['column'], y = -nickname-['column'])
## - insert matplot-. show ()





# %%
############# LECTURE 2 ##################

# Import Libraries 
## matplotlib.pyplot, is used to create graphs 

# Identify type of object 
## type(-insert desire marker here-)

# Store variables (labeling) 
## -insert nickname-  = -actual label-

# print stuff 
## print(-insert name-)

# Basic operations on numbers
## print(3*2) multiplication 
## print(3+2) addition 
## print(3-2) subtraction
## print(3/2) division 
## print(3**2) expoonentiation 

# Add a strings 
## "Some phrase " + -variable-
## Example: name = "Daisy" and "My name is" + name 

# Store Lists (numbers) remember things start at 0 
##  list_name = [#, #, #, #....]

# Store Lists (words) remember things start at 0 
## list_name = ["word", "word", "word"...]

# Printing from a list 
## print(list_name[#])

# Make histogram 
## matplot.hist(x= -list_name-)

# Histogram data continue 
## matplot.scatter(x = -list_name-, y = -list_name-)   shows actual lists with their inputs
## plt.xlabel("insert name of label")
## plt.ylabel("insert name of label")

# You can convert an integer to string first
## print("word" + str(number))

# %%
############### LECTURE 3 ################

# numpy is used for mathematical operations 

# Numpy numbers 
## np.pi  finds pi but you can change it 
## log(x) computes the logarithm with base "e" (Euler constant)
## exp(x) compute the Euler constant raised to the power of "x"
## sing(x) computes the sine of x
## cos(x) computes the cosine of x
## In this example, we're substituting x = 1

# Creating Vectors 
## vec_some letter = np.array([#,#,#,#...#])

# Operations on Vectors 
## print (vec_name _some operation_ numbr )
## print (vec_name _operation_ vec_name

# Statistics of an array 
## print(np.mean(vec_a))
## print(np.std(vec_a))
## print(np.min(vec_a))
## print(np.median(vec_a))
## print(np.max(vec_a))

# Create a vector of random variables 
## This code creates a vector of random variables 
## generated from a normal distribution with
## mean "loc" (location) and standard deviation "scale"
## the number of distinct variabels is "size"

## randomvar_name = np.random.normal(loc=#, scale=#, size=#)
## print(randomvar_a)

# Setting the seed 
## np.random.seed(######) so basically any time I want these numbers I should set a seed 

# Matrix Operations 
## X = np.array([[#,#,#],[#,#,#],[#,#,#]]) Basically every box is a row 
## print(X)

# You can also stack columns
## Y =  np.column_stack([[1,0,1],[2,1,0]])
## print(Y)

# Matrix Transpose
## np.matrix.transpose(Y)

# Matrix Multiplication
## np.dot(X,Y)
## np.matmul(X,Y)

# Check the determinant of a matrix (a matrix is invertible if the determinant is not zero)
## print(np.linalg.det(X))

# Matrix inverse
## The following command stands for linear algebrar inverse.
## X_inv = np.linalg.inv(X)

# Output the result
## print(X_inv)




# %%
############### LECTURE 4 ################

# Test equality, true of false response, with a double equal sign: _==_
    # don't do a single "=" because that will just assign words into that name

# "in" a command without "" is used to check if a input is contained in a sentence 
    # _variable_ in _variable_  OR    print(_variable_ in _variable_)
    # note that it doesn't even have to be a full word it can be partial to words 

# With numbers you don't really need the "in" command you can just type it out 
    # x = 5
    # print( x < 5 ) and so on 

# isinstance command telling you the type 
    # y = 10
    # print( isinstance(y,int)  )
    # print( isinstance(y,float) )
    # print( isinstance(y,str) )

# Equality of vectors is done element by-element 
    # vec_a = np.array([1,2,3])
    # vec_b = np.array([1,2,4])
    # vec_a == vec_b

# REMEMBER the numerical value of e or most math symbols need np.___
    # np. e**5 < 50

# not (_word_ > _#_) kind showing a negative of an expression 

# & is used for and condition 
    # (gbadgjad) & (ajbgakjd)

# | is used for or condition 
    # () | ()

# Test expression
    # We type "if" followed by a logical condition and the ":" symbol.
    # The ":" says: run the following command 
    # Body of expression
    #  The "body" of the "if" statement needs to indented
    # You can indent text by pressing the "tab" button in your keyborad.
    # If the condition is true, a message will appear.
    # If the condition is false, then nothing happens
    # We start by defining a string
        # any_questions = "yes"
        # if any_questions == "yes":
            # print("Need to give more explanations")

# EXPLANATION OF IF/ELSE SYNTAX 
    #   If/else statements are useful to run different types of commands
    #   This code prints a red graph if "is_red_graph" is set to "True" and outputs a purple graph otherwise.
    # Notation: You can use the prefix "is_" to denote boleean variables
    #  VIEWING OUTPUT:
    #   You can guarantee that the graph appears with plt.show()

import matplotlib.pyplot as plt
import numpy as np
is_graph_red     = True #If you change this to false it will be purple
how_many_classes = np.array([7,1,2,3,3,3,4,5,6])

if is_graph_red:
    plt.hist(x = how_many_classes, color="red")
    plt.title("Count of students in each category")
    plt.xlabel("How many classes are you taking?")
    plt.show() 
else:
    plt.hist(x = how_many_classes, color="purple")
    plt.title("Count of students in each category")
    plt.xlabel("How many classes are you taking?")
    plt.show()

# The elif (a shorthand for elif) is a good alternative to evaluate mutually exclusive options
    # 

years_in_program = 2

if years_in_program == 1:
    print("This student is a freshman")
elif years_in_program == 2:
    print("This student is a sophomore")
elif years_in_program == 3:
    print("This student is a junior")
else:
    print("This student is a senior")











# %%
############### LECTURE 5 ################

# There is "int", "float", "str", "boleean" but there is also "None" (or null)
    # list_answers = [None,None,None]
    # list_answers[0] = "Chicago"
    # list_answers[1] = "New York"
    # list_answers [2] = "Boston"
        # What you are doing is basically replacing the None values to other values

# We can start an empty list with []
# Use the command "new_list.append(item)" with the function "append()"
# an an arbitrary value of "item"
    # new_list = []
    # new_list.append("Tuesday")
    # new_list.append("Monday")
    # new_list.append("Wednesday")
        # print(new_list)

# Repeat a single value 30 times
    # list_two_rep = [7] * 30

# Repeat a list 4 times
    # list_answers_rep = list_answers * 4

 # Repeat of 8 null values
    # list_none_rep = [None] * 8 

# When you multipy a list times a number you repeat the list
    # list_a = [1,2,3]
     # print( list_a*4)

# When you multipy an array times a number, you multiply each element
    # vec_a = np.array(list_a)
    # print( vec_a * 4)

# len() is a function that counts the number of elements
    # print(len(________)) like print(len(list_answers))

# For Loops 
    # list_ids = ["KIA", "Ferrari", "Ford", "Tesla"]
    # for id in list_ids:
        # print("Dear customer, we are writing about your "  + id + " car.")

# Customized Messages + Numbering 
    # One way to construct a sequence manually, is to gradually add numbers
    # We will do this automatically for a for loop!
    # Note: We can use "str(index)" to convert this to a string
    
list_ids = ["KIA", "Ferrari", "Ford", "Tesla"]

index = 1
for id in list_ids:
    print("Dear customer, your position is " + str(index) + " on the waitlist" +
           " and your car brand is " + id )
    index = index + 1

# Plots for multiple variables 
    # carfeatures = pd.read_csv("data/features.csv")
list_vars   = ["acceleration","weight"]

# for variable_name in list_vars:
     #plt.scatter(x= carfeatures[variable_name], y = carfeatures["mpg"])
   #  plt.ylabel("mpg")
   #  plt.xlabel(variable_name)
   #  plt.show()

# To incorporate more aspects of the day, just add more into the list_vars 

# Plots for multiple variables + Numbering 

# carfeatures = pd.read_csv("data/features.csv")
list_vars   = ["acceleration","weight"]

index = 1
for variable_name in list_vars:
   # plt.scatter(x= carfeatures[variable_name], y = carfeatures["mpg"])
    plt.ylabel("mpg")
    plt.xlabel(variable_name)
    plt.title("Figure" + str(index))
    plt.show()
    index = index + 1
# In this case the index is just added to the title for every new variable we add 
 
 # n = 50
    # list_zero_fifty = list(range(n +1))  (This makes it faster to get a lot of numbers in a list )


# %%
############### LECTURE 6 ################

# Visualizing Random Variables 
    # We can simulate from different distributions 
    # n = _sample size_
        # vec_normal  = np.random.normal(loc = _#_, scale = _#_, size = n) ----------- "loc" and standard deviation
        # vec_chisqr  = np.random.chisquare(df = _#_, size = n) -----------------------"df" degrees of freedom
        # vec_unif    = np.random.uniform(low = _#_,high = _#_, size = n) ------------- values between ___ and ____


# Setting up subplots 
    # Create a plot with 1 row, 2 columns
    # You will create a list of subfigures "list_subfig"
    # You can choose whichever name you like
    # The option "figsize" indicates the (width,height) of the graph
fig, list_subfig = plt.subplots(1, 2,figsize = (6,3))
# The tight layout option ensures that the axes are not overlapping
plt.tight_layout()
# First Figure
#list_subfig[0].hist(x = vec_normal)
list_subfig[0].set_title("Normal Distribution")
list_subfig[0].set_xlabel("Value")
list_subfig[0].set_ylabel("Frequency")
# Second Figure
# list_subfig[1].hist(x = vec_unif)
list_subfig[1].set_title("Uniform Distribution")
list_subfig[1].set_xlabel("Value")
list_subfig[1].set_ylabel("Frequency")

# Use "list(range(n))" to create a list from 0 to (n-1).

# Remember that the Central Limit Theorem, states that as n is bigger value, then the more noticable is the bell shape 

# To do multiple graphs with different sample sizes do something similar to this: sample_size_list = [1,10,50]
    # Then just set everything else from there, for- in statement, graph and done 

# Loops + If/else
    # lower_bound = Xbar - 1.96*(sample_stdv / np.sqrt(n))
    # upper_bound = Xbar + 1.96*(sample_stdv / np.sqrt(n))


# %% [markdown]
# <font size = "5">
# 
# A 95\% normal confidence interval is defined by $\ldots$
# 
# - lower_bound = $\bar{X} -1.96 \times  \frac{\text{sample\_stdv}}{\sqrt{n}}$.
# - upper_bound = $\bar{X} + 1.96 \times \frac{\text{sample\_stdv}}{\sqrt{n}}$.


