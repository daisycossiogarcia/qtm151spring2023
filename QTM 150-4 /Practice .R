4/2
7563/49
5*8
6*6
7563 %% 49
7563%/%49
(12+53+22+14+95) / 5
mean(c(12,53,22,14,95))
avg_num <- mean(c(12,53,22,14,95))
num <- c(1,2,3,4,5)
# ^ this is the same as....
num2 <- 1:5
c("a", "b,", "c")
one_to_ten <- 1:10
# ^ This doesn't do much you're just labeling 
one_to_ten
# ^ so now when you type this it's going to label the numbers 1 through 10 
ten_ones <- rep (1, 10)
# Okay now it's labeled next. rep just means repeat the number 1 ten times.  
ten_ones
# you can use the ? to pop up to see how to use it
odd_num100 <- seq(1, 99, 2)
# Some this means is that you want the numbers from 1 to 99 by increments of 2, giving you odd numbers 
odd_num100
length(odd_num100)
# ^ This just tells you how many values are in the sequence 
odd_num100[5]
#This is going to take out the SPECIFIC number element so in a sequence it's going to take out the 5th value 
odd_num100 [5:10]
# This does the same thing as the function before but not taking the elements between 5 and 10 
odd_num100[c(1, 5, 9)]
# Again brackets are for specific values 
odd_num100[-50]
# It's going to print everything but the 50th element 
odd_num100[50]
# This will only select the 50th element 


mean(gss)
