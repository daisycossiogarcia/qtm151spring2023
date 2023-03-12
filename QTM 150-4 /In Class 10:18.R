# In Class 10/18 
library(babynames)
library(dplyr)
library(ggplot2)

str(babynames)

#Q5: What are the top 5 most popular names in the year you were born in 
babynames %>%
  filter(year==2002) %>%
  group_by(name) %>%
  summarise(total=sum(n)) %>%
  arrange(desc(total))

top5names2002 <- babynames %>%
  filter(year==2002) %>%
  group_by(name) %>%
  summarise(total=sum(n)) %>%
  arrange(desc(total)) %>%
  top_n(5) %>%
  select(name)

top5names2002

#Q6: Using the 5 names from Q5, visualize a trend showing the changes in the frequency of each name over the years.
class(top5names2002)
class(as.vector(top5names2002))

babynames %>%
  filter(name %in% as.vector(top5names2002)[[1]]) %>% #
  group_by(year, name) %>%
  summarize(total = sum(n)) %>%
  ggplot(aes(x=year, y=total, color=name)) + geom_line()
  
#joins, part 1
install.packages("nycflights13")
library(nycflights13)
?nycflights13::flights
