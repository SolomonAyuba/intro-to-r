## WEEK 3 - Data Input & Output and Data Frames
## Wed 29 May 2024

## Data Input Using read.table()
#to create a data frame in R using read.table(), this assumes that the file is currently in the working directory
#the argument header = T states that the first line contains column names
prices <- read.table("crop_prices.txt", header = T); prices

#we can use read.delim() to omit stating the header argument
prices <- read.delim("crop_prices.txt"); prices

#data can be imported from another directory using the getwd() to get working directory file path  and listing the file part inside the read.table() function 

#Input Using read.csv()
#to avoid due to mismatch in variable names and columns of data - best is to save the file as a .csv file and then read it using read.csv():
# read.csv () assumes that the data has a header and no need to tell R.
location <- read.csv("crop_prices.csv"); location

# Data Input Using scan()
# For data with a fixed number of rows and columns, read.table() and read.csv() are suicient.
# What happens when the data in each row or columns are not fixed:
# scan() function can be used to read files that doesn't have fixed data in each row or column
scan("crop_prices2.txt", skip = 1)

# scan() expects to read space or tab delimited inputs, else, we specify the separator using sep = ",".
# With scan(), we have to skip the header row as it contains variable names.
# The argument skip = 1 enables us to skip the header from the data file.


# sep ='\n' end of line control character as the separator: contents of each lines have been combined to create meaningless numbers 
scan("crop_prices2.txt", skip = 1, sep = '\n')

# the read.txt() and read.csv() can both be used to read data from URLs
read.table("the URL of the data", header = T)

#built-in data sets with the datasets package (library)
data (package = .packages (all.available = TRUE))
?Titanic

## Data output using write.table()
#creating a new column ground_nut in the table
location$ground_nut <- c(13, 8, 20, 11,6); location

#we write the location data frame into a file using
write.table(location, "crop_prices3.txt"); location

#DATA FRAMES: 
# A data frame is an object with rows and columns like a matrix
# The values in the body of a data frame can vary by column. data.frame() 

data.frame(rating=1:5,
           animal=c('squirrel', 'hedgehog', 'sloth', 'rabbit', 'dog'),
           country=c('Nigeria', 'Kenya', 'France', 'China', 'England'),
           avg_sleep_hours=c(9,10,9,10,10),
           rain =c(TRUE, FALSE, FALSE, TRUE, FALSE)
)

#data from locationdata.csv data file
locationdata <- read.csv("locationdata.csv");locationdata

#insepcting data
names(locationdata) #display the header row of the dataframe
head(locationdata) #head() to look at the first 6 rows of the data
tail(locationdata) #tail() to look at the last 6 rows of the data
View(locationdata) #view() from the tibble library allows us to view data frame in the editor section of RSTudio

#Summary Function
# The data frame can also be summarised
summary(locationdata)

# by() and aggregate() function allows summary of the data on the basis levels
# finding the average sleep hours of each animal
by(locationdata$sleep_hours, locationdata$animal, mean)
# finding the effect of rain on each animal
by(locationdata$rain, locationdata$animal, mean)

?aggregate

#indexing dataframes. Dataframes are indexed exactly he same way as with arrays
locationdata[3,5]
locationdata[14:19,4]
locationdata[1:5, 2:3]
locationdata[, 3]
location[2, ]
locationdata$rain
locationdata[sample(1:20, 4),]

#Sorting Data Frames using order()

#To sort dataframe based on values(sleep_hours) in one column
locationdata[order(locationdata$sleep_hours),]

# to sort the dataframe based on sleep_hours in descending order
locationdata[order(locationdata$sleep_hours, decreasing = TRUE),]

# order based on rating within each animal type
locationdata[order(locationdata$animal, locationdata$rating),]

#display only certain columns in the sorted data frame
#display animal, rating & sleep_hours
#The columns can also be selected on the basis of their variables names.c(1,2,4)
locationdata[order(locationdata$animal, locationdata$rating), c(1,2,4)]

#Logical conditions to select rows in a data frame

#display rows where a variable is true. e.g $rain is TRUE, FALSE
locationdata[locationdata$rain == TRUE,]
locationdata[locationdata$rain == FALSE,]

#display the row containing only dogs
locationdata[locationdata$animal == 'dog',]

#To extract all the columns that contain numbers from the data frame.
#The function is.numeric() can be applied across all the columns of locationdata 
#using sapply() to create the appropriate indices:
sapply(locationdata, is.numeric)
locationdata[sapply(locationdata, is.numeric)]

#Removing Duplicates
#A data frame sometimes contain duplicate rows where all the variables have 
#exactly the same values in two or more rows, perhaps by mistake:
dup_date <-data.frame (Jan=c(1, 2, 3, 2, 1), 
                       march=c(4, 5, 6, 5, 4),
                       may =c(7, 8, 9, 10, 7), 
                       july=c(9, 10, 11, 10, 9))
dup_date #display dup_date properties

#To remove the duplicate rows, we can use the unique() function:
unique(dup_date)
#The row names are the same as the original - you can spot that row number 5 was removed.
#unique() also work equally well on vectors, matrices, and arrays.

#Matching Functions
#To view duplicate rows in a data frame (if any), duplicated() is used:
duplicated(dup_date)
dup_date[duplicated(dup_date),]

#remove duplicates from animal col on locationdata
locationdata
unique(locationdata$animal)

#suppose we want to appropriate food for the different animals
animal_feed <- read.csv("animal_feed.csv"); animal_feed

#We want to create a vector in locationdata containing the appropriate food.
locationdata[1:2, ]
#The first value needs to be hay because row 1’s animal is a squirrel,and 
#the second needs to be straw because row 2’s animal is a hedgehog.
#The first argument in match() is what we want to match locationdata$animal,
#and the second argument selects the appropriate row from animal_feed.
match(locationdata$animal, animal_feed$animal)
food <- animal_feed$feed[match(locationdata$animal, animal_feed$animal)]
food

#We add this information as a new column to the data frame locationdata:
locationdata$feed <- food
locationdata[1:5, ]

#Merging Functions
#To merge two data frames at least one of the columns must be identical in variable names in the two data frames - merge() function is used.
#Using the above two data frames:

merge(locationdata,animal_feed, all = TRUE)

#The all = TRUE option, allows us to include all the fields and
#missing values (NA) are inserted for missing values.



#INTERACTIVE ACTIVITY | readr and readxl packages

#installing readr package for reading rectangular data like csv
install.packages("readr")
library(readr)
?readr

#how to create a file
file.create("mivalearner.csv")

#import url data into R tibble
dat <- read.csv("http://www2.hawaii.edu/~georgeha/Handouts/SchoolSurvey.csv"); dat

#treating the first column as character type and the second as double, and skips the first two rows.
data <- read_csv("mivalearner.csv", 
                 col_types = cols(col1 = col_character(), 
                                  col2 = col_double()), 
                 skip = 2)


#installing readxl package for reading microsoft excel files
install.packages("readxl")
library(readxl)
?readxl

#how to read an excel file
readxl::read_excel("datasciencecourse.xlsx")
#readxl offers various customisation options to refine your reading experience. 
#You can specify sheets, ranges, and more:
df <- read.csv("datasciencecourse.csv");df
#This reads the data contained in the Excel file. To select one row you can use.
df["Month"]


#Reading Data with readr

#the col_types parameter allows you to explicitly define the individual column types.
#You can use the cols() function to specify the types:
data <- read_csv("doesntexist.csv", col_types = cols(
  Column1 = col_double(), #Reads the column 1 as a double-precision floating-point number.
  Column2 = col_character(), #Reads the 2 as a character string.
  Column3 = col_logical() #Reads the column 3 as a logical value (TRUE/FALSE).
))
#You can specify as many columns as needed and use various functions like
# col_integer(), col_factor(), etc., to define the types.

#Using Shortcuts
#This will read the first column as double, the second as character, and the third as logical.
data <- read_csv("doesntexist.csv", col_types = "dcl")



#Reading Data with readxl
data <- read_excel("datasciencecourse.xlsx", sheet = "Sheet 1", range = "A1:B10")
#sheet = "Sheet 1": This specifies the name or index of the sheet you want to read.
#In this case, the sheet named "Sheet 1" is targeted.
#range = "A1:B10": This defines the cell range you want to read from the 
#specified sheet. In this case, cells from A1 to B10 are read.

#Reading Multiple Sheets
#You can read multiple sheets by looping through their names or indices:
sheets <- c("Sheet 1", "Sheet 2")
data_list <- lapply(sheets, function(s) read_excel("doesntexist.xlsx", sheet = s))

#Combining with Other Parameters
#such as col_names, col_types, etc.


## Find Week 4 on Week 4.R script.