# Assignment 7
library(dplyr)
library(lubridate)
library(forcats)
library(babynames)
library(tidyverse)
library(ggplot2)
str(babynames)
# Q1:
  babynames %>%
    group_by(sex, year) %>%   #TDLR: Makes each sex and year factor into one and not repeated 
    summarize(totalbabies= sum(n)) %>%
    select(year, sex, totalbabies) %>%
    pivot_wider(names_from = "sex", values_from= totalbabies) %>%
    mutate(total= F + M,
           prop_F = F/ total,
           percent_F = prop_F * 100) %>%
    select(year, percent_F) %>%
    ggplot(aes(year, percent_F)) + geom_line()
  
# Q2: 
  levels(gss_cat$rincome)
gss_cat%>%
    mutate(income3 = fct_collapse(rincome,
                                  "Less than $8K" = c("$7000 to 7999", "$6000 to 6999", "$5000 to 5999", "$4000 to 4999", "$3000 to 3999", "$1000 to 2999", "Lt $1000"),
                                  "Greater than $8K and Less than $15K" = c("$10000 - 14999", "$8000 to 9999"),
                                  "$15K or more" = c("$25000 or more", "$20000 - 24999", "$15000 - 19999"),
                                  "Other" = c("No answer", "Don't know", "Refused", "Not applicable" )))%>%
    select(income3, tvhours)%>%
    filter(!is.na(tvhours))%>%
    group_by(income3)%>%
    summarize(avg_tvhours = mean(tvhours))%>%
    ggplot(aes(avg_tvhours, fct_reorder(income3, avg_tvhours))) + geom_col()

# Q3:Part 1 
make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}
flights_wday <- flights%>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(arrival_time= make_datetime_100(year, month, day, arr_time),
         departure_time = make_datetime_100(year, month, day, dep_time),
         scheduled_dep_time = make_datetime_100(year, month, day, sched_dep_time),
         scheduled_ar_time = make_datetime_100(year, month, day, sched_arr_time))%>%
  select(origin, dest, ends_with("delay"),ends_with("time"))

flights_wday %>%
  ggplot(aes(wday(departure_time))) + geom_bar() + labs(x="weekday")

# or....


flights_dt %>% 
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  ggplot(aes(x = wday)) +
  geom_bar()

# Q3:Part 2a
str(flights_dt)
flights_wday%>%
  group_by(minute(departure_time))%>%
  mutate(avg_dep_delay_m = mean(dep_delay))%>%
  ggplot(aes(x=minute(departure_time), y=avg_dep_delay_m)) + geom_line()+labs(x ="minute")

#Q3: Part 2b 
flights_wday%>%
  group_by(minute(scheduled_dep_time))%>%
  mutate(avg_dep_delay_m = mean(dep_delay))%>%
  ggplot(aes(x=minute(scheduled_dep_time), y=avg_dep_delay_m)) + geom_line()+labs(x = "minute")



str(flights_dt)



          
  