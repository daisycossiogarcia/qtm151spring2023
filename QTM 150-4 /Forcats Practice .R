# Forcats 
  # This package provides some tools for working with categorical variables (factors)
  # Question 1: find the relationship between religion and average hours of watching tv 
library(dplyr)
install.packages("forcats")
library(forcats)
library(ggplot2)
library(nycflights13)
library(tidyr)

?gss_cat
str(gss_cat)
gss_cat #General Social Survey dataset 

relig_summary <- gss_cat %>%
  group_by(relig) %>% #a column will be relig
  summarize(avg=mean(tvhours, na.rm=T)) %>% #finding teh avg of tvhours, excluding na's
  arrange (desc(avg)) #arranging from greatest to least amount
relig_summary # print

relig_summary1 <- gss_cat %>% 
  filter(!is.na(tvhours)) %>% # This is another way to drop na's 
  group_by(relig) %>%
  summarize(avg= mean(tvhours)) %>%
  arrange(desc(avg))
relig_summary1  

relig_summary2 <- gss_cat %>%
  drop_na(tvhours) %>% #yet another way to drop all NAs 
  group_by(relig) %>%
  summarize(avg=mean(tvhours)) %>%
  arrange(desc(avg))
relig_summary2

relig_summary == relig_summary1 
relig_summary == relig_summary2
# ^ they're all the same 

ggplot(relig_summary, aes(x=relig, y=avg)) + 
  geom_col() # This is not the best plot, looks really gross 

#flip it! 
ggplot(relig_summary, aes(x=relig, y=avg))+ 
  geom_col() + 
  coord_flip() 
?coord_flip # Cartesian coordinates with x and y flipped. Basically horizontal becomes vertical and vertical, horizontal. 

  # How could we interpret the plot without overall pattern? Not easy. 

#fct_reorder()
  # Reordering the levels of a factor using fct_reorder().
  # fct_reorder() takes three arguments: 
    # f, the factor whose leveles you want to modify 
    # x, a numeric vector that you want to use to reorder the levels. 
    # Optionally, fun, a function used if there are multiple values of x for each value of f. The default value is median. 

  ### fct_order(f, x)
ggplot(relig_summary, aes(x=avg, y=fct_reorder(relig,avg))) +
  geom_col()

  ### fct_rev() 
ggplot(relig_summary, aes(x=avg, y=fct_rev(fct_reorder(relig, avg))))+
  geom_col() #samething as the code prior just in reverse order 

  # remove all parentheses by using %>% instead 
ggplot(relig_summary, aes(x=avg, y=fct_reorder(relig, avg) %>% fct_rev())) +
  geom_col()

# fct_relevel
  #However it makes sense to pull "Don't know" to the front with the otehr special levels. You can use fct_relevle().
  # It takes a factor, f, and then any number of levels that you want to move to the front of the line (the bottom of the plot). 

  ## fct_relevel(f, "level", after= )
  ## hour could we keep the ascending order but move "DK" to the bottom? 
ggplot(relig_summary, aes(x=avg, y=fct_relevel(relig, "Don't know", after=0))) +
  geom_col()
ggplot(relig_summary, aes(x=avg, y=fct_relevel(relig, "Don't know", after=1))) +
  geom_col()
ggplot(relig_summary, aes(x=avg, y=fct_relevel(fct_rev(fct_reorder(relig,avg)),"Don't know", after=0)))+
  geom_col() #alternatively, >
ggplot(relig_summary, aes(x=avg, y=fct_reorder(relig,avg) %>% fct_rev() %>% fct_relevel("Don't know", after=0)))+
  geom_col()

# fct_infreq()
  # You can use fct_infreq() to order levels in increasing frequency: this is the simplest type of reordering because it does not need any extra variables. You may want to combine with fct_rev().
gss_cat %>%
  ggplot(aes(x=marital))+
  geom_bar()
barplot(sort(table(gss_cat$marital)))


    # fct_infreq(f)
gss_cat %>%
  ggplot(aes(x=fct_infreq(marital)))+
  geom_bar()

# reverse order of factor levels using fct_rev()
gss_cat %>%
  ggplot(aes(x=fct_rev(fct_infreq(marital))))+
  geom_bar()

# %>% instead of layers of parentheses
gss_cat %>%
  ggplot(aes(x=fct_infreq(marital) %>% fct_rev()))+
  geom_bar()

# fct_recode
    # Question 2: find the relation between party affiliation and average hours of watching tv.
gss_cat %>%
  group_by(partyid) %>%
  summarize(avg=mean(tvhours,na.rm=T)) %>%
  arrange(avg)


gss_cat %>%
  group_by(partyid) %>%
  summarize(avg_age=mean(age,na.rm=T)) %>%
  arrange(desc(avg_age)) %>%
  ggplot(aes(avg_age,partyid)) +
  geom_bar()


  # but it is hard to answer the question, we need to recode factor fct_recode()
levels(factor(gss_cat$partyid))

# fct_recode(f, )
gss_cat %>%
  mutate(partyid1 = fct_recode(partyid,
                               "Republican, strong" = "Strong republican",
                               "Republican, weak" = "Not str republican",
                               "Independent, near rep" = "Ind,near rep",
                               "Independent, near dem" = "Ind,near dem",
                               "Democrat, weak" = "Not str democrat",
                               "Democrat, strong" = "Strong democrat"
  )) %>% 
  count(partyid1)
#notice that fct_recode() leaves levels that aren't explicitly mentioned as is

gss_cat %>%
  mutate(partyid1 = fct_recode(partyid,
                               "Republican, strong" = "Strong republican",
                               "Republican, weak" = "Not str republican",
                               "Independent, near rep" = "Ind,near rep",
                               "Independent, near dem" = "Ind,near dem",
                               "Democrat, weak" = "Not str democrat",
                               "Democrat, strong" = "Strong democrat",
                               "Other" = "No answer",
                               "Other" = "Don't know",
                               "Other" = "Other party"
  )) %>%
  count(partyid1)

#let's look at avg tv hours by partyid
gss_cat %>%
  filter(!is.na(tvhours)) %>%
  mutate(partyidnew = fct_recode(partyid,
                                 "Republican, strong"    = "Strong republican",
                                 "Republican, weak"      = "Not str republican",
                                 "Independent, near rep" = "Ind,near rep",
                                 "Independent, near dem" = "Ind,near dem",
                                 "Democrat, weak"        = "Not str democrat",
                                 "Democrat, strong"      = "Strong democrat",
                                 "Other"                 = "No answer",
                                 "Other"                 = "Don't know",
                                 "Other"                 = "Other party")) %>%
  group_by(partyidnew) %>%
  summarize(avg=mean(tvhours))

# fct_collapse()
  # If you want to collapse a lot of levels, fct_collapse() is a useful variant of fct_recode(). For each new variable, you can provide a vector of old levels:
gss_cat %>%
  mutate(partyidnew = fct_collapse(partyid,
                                   other = c("No answer", "Don't know", "Other party"),
                                   rep = c("Strong republican", "Not str republican"),
                                   ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                                   dem = c("Not str democrat", "Strong democrat")
  )) %>%
  count(partyidnew)

# fct_lump()
  # Sometimes you just want to lump together all the small groups to make a plot or table simpler. That is the job of fct_lump()

gss_cat %>%
  mutate(relig = fct_lump(relig)) %>%
  count(relig)

gss_cat %>%
  mutate(relig = fct_lump(relig, n = 10)) %>%
  count(relig)  
levels(factor(gss_cat$relig))

#let's sort this!
gss_cat %>%
  mutate(relig = fct_lump(relig, n = 10)) %>%
  count(relig, sort = TRUE) %>%
  print(n=5) #make n=Inf if you want to print everything
gss_cat %>%
  mutate(relig = fct_lump(relig, n = 10)) %>%
  count(relig, sort = TRUE) %>%
  print(n=Inf)

# case_when
mtcars %>%
  mutate (
    transmission =
      case_when(
        am==0 ~ "automatic",
        am==1 ~ "manaul"
      )
  )

mtcars %>%
  mutate (
    gear_char =
      case_when(
        gear==3 ~ "three",
        gear==4 ~ "four",
        gear==5 ~ "five"
      ) 
  )

starwars %>%
  select(name:mass, gender, species) %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~ "other"
    )
  )



# LUBRIDATE!!!
  # This lab will focus on the lubridate package, which makes it easier to work with dates and times in R.
install.packages("lubridate")
library(lubridate)
today()
now()
    # There are usually two ways you are likely to create a date/time:
    # From a string:
    # use the lubridate function to parse your date
ymd("2022-11-06")
mdy("November 6th, 2022")
dmy("06-Nov-2022")

#to add time to ymd, use ymd_hms()
ymd_hms("20221106 23:59:59")
ymd_hms("2022-11-06 23:59:59")

    # From individual components
    # use make_date() for dates, or make_datetime() for date-times:

  # Let's create a new variable called $departure_sched by combining values from other variables related to scheduled departure times (i.e., $hour, $minute) in the flights data set.

str(flights)
flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure_sched = make_datetime(year, month, day, hour, minute))

    # Similarly, we can also reformat other time-related variables (i.e., dep_time, arr_time, and sched_arr_time) into the correct date-time format.
    # However, note that the other time-related variables (i.e., dep_time, arr_time, and sched_arr_time) report hour and minutes in a combined format
  
#reformatting dep_time
flights %>%
  select(year, month, day, dep_time) %>%
  separate(dep_time, into=c("act_h", "act_m"), sep=-2) %>% #rather than sep=1, use sep=-2. why?
  mutate(departure_time = make_datetime(year, month, day, act_h, act_m))

##This is good, but to do this multiple times for arr_time, and sched_arr_time can be tedious and cumbersome.    

#To do this efficiently, therefore, we will temporarily create a function called make_datetime_100()
#which separates hour and minutes
make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

#Now, using make_datetime_100(), let's reformat dep_time, arr_time, sched_dep_time, and sched_arr_time.

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>%  # remove all cancelled fights
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time")) 
flights_dt

# With this data, we can visualize the distribution of departure times across the year:
flights_dt %>% 
  ggplot(aes(arr_delay)) + 
  geom_histogram()

str(flights_dt)
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

#Alternatively, 
flights_dt %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 86400) # 86400 seconds = 1 day

#Instead of looking at the entire year, let's just pick a single day, Jan 2st, 2013.
flights_dt %>% 
  filter(dep_time < ymd("20130102")) %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 600) # 600s = 10minutes

# Date-time components:
    # pull out individual parts of the date with the following functions:

   ##you may want to switch between a date-time and a date. as_datetime() and as_date() would do that.

daylight_saving_ends <- ymd_hms("2022-11-06 02:00:00") #Daylight saving time 2022 in GA ends at 2AM on Sunday, 11/6

as_date(daylight_saving_ends) #just the date
year(daylight_saving_ends)
month(daylight_saving_ends)
month(daylight_saving_ends, label=T) #prints the abbreviated name of the month 
month(daylight_saving_ends, label=T, abbr=F) #prints the name of the month
#day, hour, min, sec
day(daylight_saving_ends)
mday(daylight_saving_ends) #day of the month
yday(daylight_saving_ends) #day of the year
wday(daylight_saving_ends)
wday(daylight_saving_ends, label=T) #prints the abbreviated name of which day of week
wday(daylight_saving_ends, label=T, abbr=F) #prints which day of week
hour(daylight_saving_ends)
minute(daylight_saving_ends)
second(daylight_saving_ends)

# Now, try the following examples!

flights_dt %>% 
  filter(arr_time < dep_time) %>%
  select(origin, dest, dep_time, arr_time, air_time)
#Notice any errors?
days(1) #1 day

flights_dt %>% 
  mutate(
    overnight = arr_time < dep_time, #returns TRUE/FALSE
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  ) %>%
  filter(overnight==TRUE) %>%
  select(origin, dest, dep_time, arr_time, air_time)

#Now, THAT's better! ;-)


str(flights_wday)

str(gss_cat)
gss_cat %>%
  group_by(sex, year) %>%   #TDLR: Makes each sex and year factor into one and not repeated 
  summarize(totalbabies= sum(n)) %>%
  select(year, sex, totalbabies) %>%
  pivot_wider(names_from = "sex", values_from= totalbabies) %>%
  mutate(total= F + M,
         prop_F = F/ total,
         percent_F = prop_F * 100) %>%
  select(year, percent_F) %>%
  ggplot(aes(year, percent_F)) + geom_line()
