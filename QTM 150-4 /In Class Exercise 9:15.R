# In-class exericse 9/15 

# Question 1: Print ONLY the odd numbers from a list of 50 random numbers ranging from 1 to 100. 
d <- seq(1:100)
d
e <- sample(1:100, 50)
e
odd_number_50 <- e[e%%2==1]
odd_number_50

# Question 2: state.name prints the names of all 50 states in the USA. How many states begin with an "N"? Print the names of those states only.
state.name
state.name[substring(state.name,1,1)=="N"]
length(state.name[substring(state.name,1,1)=="N"])

# Question 3: Create a subset of movies that were released in ONLY the even years.
movies_even_years <- movies[movies$year%%2==0,]
movies_even_years

# Question 4: What's the average $score of movies for EACH year? Which year shows the HIGHEST average score?
average_score_each_year <- tapply(movies$score, movies$year, mean)
average_score_each_year
max(average_score_each_year)

# Question 5: Create a new variable called movies_rated$rating2 by reassigning the levels of $rating into either "R" or "Not R".
movies_rated$rating2 <- factor(ifelse(movies_rated$rating == "R", "R", "Not R"))
movies_rated$rating2

# Question 6: Which $star appeared in the most number of movies? How well did those movies do in terms of both $gross and $score (i.e., report the average $gross and $score)? Try answering this question WITHOUT creating a subset.
movies_rated$star_movies <- factor(movies_rated$star)
summary(movies_rated)
tapply(movies_rated$gross, movies_rated$star == "Nicolas Cage", mean)
tapply(movies_rated$score, movies_rated$star == "Nicolas Cage", mean)
