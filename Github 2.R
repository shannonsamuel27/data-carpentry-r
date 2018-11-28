##use this file to follow along with the live coding exercises.
##The csv file contatining the data is the 'data'/'directory.
##If you want to ave plots you createdd, place them in the 'figures'/'direct. 
## You can create additional R files in the 'scripts/'directory 

library(tidyverse)
read_csv("data/SAFI_clean.csv", na="NULL")
interviews<-read_csv("data/SAFI_clean.csv", na="NULL")
interviews
as.data.frame(interviews)
View(interviews)

