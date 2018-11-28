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

#inspect data
dim(interviews)#dimensions
#rows:coloumns 
ncol(interviews)#no of coloumns 
nrow(interviews)#no of rows 

head(interviews)# first parts of the data
tail(interviews)#last few entry data 
head(as.data.frame(interviews))

names(interviews)

str(interviews)
summary(interviews)

#each column is a vector 

interviews[1, 1]
interviews[1, 6]
interviews[1:5, 6]
interviews[1, 1:4]
interviews[1, 1:14]
interviews[1, 1:ncol(interviews)] #this is such a common item that there are short cuts 
interviews[1, ]
interviews[ ,6]
interviews[6]
interviews[1:6]

interviews["respondent_wall_type"]#search for the name as well

interviews[, -1]

interviews_100<-as.data.frame(interviews[100,])
interviews_100

interviews_100<-(interviews[100,])
interviews_100

interviews_100<-interviews[100, ]

interviews [nrow(interviews),]
tail(interviews)
interviews[nrow(interviews),] # gives last row 
interviews_last<-interviews[nrow(interviews),]
n_row<-nrow(interviews)
interviews[n_row/2,]
interviews_middle<-interviews[nrow(interviews)/2,] #gives middle 
interviews_middle
n_row
n_row/2
interviews[66,]
interviews[round(n_row/2),]
interviews[ceiling(n_row/2),]


interviews[-(7:nrow(interviews)),]
