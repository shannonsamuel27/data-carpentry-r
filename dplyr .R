# dplyr and tidyr
library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

select(interviews, village, no_membrs, years_liv)
select(interviews, village:rooms)

#filtering 
filter(interviews, village=="God")
filter(interviews, 1:nrow(interviews)%in% 1:10)

interviews2<-filter(interviews, village=="God")
interviews_god<-select(interviews2, no_membrs, years_liv)
interviews_god

interviews_god <-select(filter(interviews, village =="God"), no_membrs, years_liv)

interviews_god<-interviews%>% filter(village=="God")%>% 
  select(no_membrs, years_liv)                 

#Pipes exercise 

interviews %>% filter(memb_assoc =="yes") %>% select(affect_conflicts, liv_count, no_meals)

#mutate
interviews<- interviews %>% mutate(people_per_room = no_membrs/rooms)

mean(interviews$no_membrs)

interviews %>% group_by(village)%>% summarise(mean_no_membrs =mean(no_membrs))

interviews %>% group_by(village) %>% filter(memb_assoc == "yes") %>% 
  summarise(mean_no_membrs =mean(no_membrs))

interviews %>% group_by(village, memb_assoc) %>% summarise(mean_no_membrs =mean (no_membrs))

interviews %>% count((village))
interviews %>% count(village, sort = TRUE)                                

#interviews<- interviews %>% mutate(no_membrs = no_membrs*no_meals)
#mean(interviews$no_meals)                           

interviews %>% group_by(village) %>% 
  summarise(mean_membrs = mean (no_membrs), 
            min_membrs=min(no_membrs), 
            max_membrs = max (no_membrs)
            , n=n())


#reshaping 

(interviews %>% mutate(wall_type_logical = TRUE) %>%
  spread(key = respondent_wall_type, value = wall_type_logical, fill = FALSE ))
  
interviews <- interviews %>% gather (key = respondent_wall_type, value = "wall_type_logical", burntbricks:sunbricks)



#prepare

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")
interviews_plotting <- interviews %>%
  mutate(split_items = strsplit(items_owned, ";")) %>%
  unnest() %>%
  mutate(items_owned_logical = TRUE) %>%
  spread (key=split_items, value = items_owned_logical, fill = FALSE) %>%
  rename(no_listed_items ='<NA>') %>%
  mutate(split_months=strsplit(months_lack_food, ";")) %>%
  unnest() %>%
  mutate(months_lack_food_logical=TRUE) %>%
  spread(key = split_months, value=months_lack_food_logical, fill = FALSE) %>%
  mutate(numer_month_lack_food= rowSums(select(. , Apr:Sept))) %>%
  mutate(number_items=rowSums(select(., bicycle:television)))

View(interviews_plotting)
write_csv(interviews_plotting, path="data_output/interviews_plotting.csv")
