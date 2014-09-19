########################### In class commands ############################
course.url <- "http://kinglab.eeb.lsa.umich.edu/480"
dataset.url <- paste(course.url,
                     "data/Thrips_imaginis_Davidson1948.csv",
                     sep="/")
download.file(url=dataset.url, destfile="thrips.csv")
file.show("thrips.csv")

thrips <- read.csv("thrips.csv",comment.char="#")

sapply(thrips,class)
summary(thrips)
str(thrips)
head(thrips)
#string vs. factor
dataset.url <- paste0(course.url,"/data/seedpred.dat")
seeds <- read.table(dataset.url,header=TRUE,as.is="species")
sapply(seeds,class)
seeds <- read.table(dataset.url,header=TRUE,as.is=3)
sapply(seeds,class)
# more control
seeds <- read.table(dataset.url,header=TRUE,
                    colClasses=c(species="character")) # note that species is the name of the column and is not a string here
# changing the class after the data is read in
seeds <- read.table(dataset.url,header=TRUE)
sapply(seeds,class)
seeds$species <- as.character(seeds$species)
sapply(seeds,class)

# Factor versus numerical

seeds <- read.table(dataset.url,header=TRUE,colClasses=c(tcum="factor"))
sapply(seeds,class)

f <- factor(1:10); levels(f)
