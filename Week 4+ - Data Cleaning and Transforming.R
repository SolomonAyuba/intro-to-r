## WEEK 4 - Data Cleaning and Transformation
## Tue 04 June 2024
xc <- 1:5
xc*2
xc

#Missing Data - infinity, not a number and not available
# Calculations lead to solutions that are +∞, represented in R by Inf, or -∞ represented as -Inf:
3/0
-12/0

#Calculations involving infinity can be evaluated and other calculations, also, lead to quantities that are not numbers:
0/Inf
exp(-Inf)
Inf/0
(0:3)^Inf
Inf - Inf
Inf/Inf

#There is a clear distinction between NaN and NA (not available - the missing data symbol in R).
?NaN
?NA
#The function is.nan() is provided to check for NaN, and is.na() to check for NA.
is.nan(NaN)
is.na()

#To check whether a number is finite or infinite
is.finite(15)
is.infinite(15)
is.finite(Inf)
is.infinite(-Inf)

# Some useful functions for checking your data include
all() #takes in a logical and will be TRUE if ALL are TRUE: 
all(!is.na(x)) # are all values of x NOT NA

any() #will be TRUE if ANY are true: 
any(is.na(x)) #do we have any NA’s in x?

#The functions for working with missing data in R come from dplyr and tidyr packages - core members of the tidyverse: 
library(tidyverse)

# The functions for working with missing data in R come from dplyr and tidyr 
# packages - core members of the tidyverse: > library(tidyverse) 

# Identifying and handling missing values

#We want to discover which values in a vector are missing:
x <- c(3,6,NA,-7) ; x
x == NA #treating NA as a text and using double equals (==) to test for it.
x == "NA" #treating NA as a character
is.na(x) #checking for missing value

#There are other functions to deal with a vector that might contain NAs.
# Let’s create a new vector with no NAs:
y <- c(3,6,14,-7) ; y 
y == "NA"
is.na(y)

#a.omit() gives us the data without NAs and also tell us which positions
# have been omitted, while na.fail() gives an error if there are NAs.
na.omit(x)
na.fail(x)
na.omit(y)
na.fail(y)

#na.omit() enables us to edit out rows containing missing values:
df_x <- data_frame(
          x1 = c(1:4),
          x2 = c(2, 9, NA, 3),
          x3 = seq(9, 0, -3),
          x4 = c(7, 4, 5, 6),
          x5 = c(2, NA, 7, 4))
df_x

red_df <- na.omit(df_x)
red_df

#From one of the exercise in week 3, you must have noticed that some functions do not work with their default seings with missing values:
mean(x)
# To do this, we need to specify that the NAs are to be removed, using the na.rm = TRUE argument - this can be done for
# many functions.
mean(x, na.rm = TRUE)
mean(x[!is.na(x)])

which(is.na(x)) #which()find the locations of missing values within a vector:
x

x[is.na(x)] <- 0 #If the missing values are genuinely zero, we can replace the NAs to 0s:
x

# Also, the ifelse() function can be used also:
# In analysis, we need to ensure we are so sure, because most missing values are not really not zeros.
x <- c(3,6, NA, -7)
ifelse(is.na(x), 0, x)

## Factors
# Factors are categorical variables that have a fixed and known number of values (levels).
# They are used in displaying character vectors in a non-alphabetical order.
# A categorical variable is one that has two or more categories (levels).
# The two types of categorical variables are - nominal and ordinal.

# Factors Basics - Nominal Variable
#Using gender, if we had 3 females, 2 males and 2 non-binary, we create the factor:
gender <- factor(c ("female", "male", "non-binary", "female", "male", "non-binary", "female"))
gender
table(gender)
class(gender)
mode(gender) #factors are stored as Numbers in R

# Factors Basics - Ordinal Variable
# Imagine that you have a variable that records the month
M <- c("Dec", "Apr", "Jan", "Mar")

#Using a string to record this variable can lead to typos and it does not sort in a meaningful way:
sort(M)

#Both problems are easily fixed using a factor. First, we create a list of the levels in the valid order:
month_levels <- c( "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                   "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

#We then create a factor using the valid levels:
  M1 <- factor(M, levels = month_levels)
sort(M1)

# Factors Basics -  Dataframe
# Let’s create a data frame by reading data from a file:
datafac <- read.csv("df_factor.csv")
head(datafac)
class(datafac$sex) #Let’s look at the class of the sex column:
#We can clearly see we have two columns that we would like to import as factors.

#So to import the pclass and sex columns as factors:
datafac <- read.csv("df_factor.csv", 
                    colClasses = c("factor","integer","factor"))
class(datafac$pclass)
class(datafac$sex)
is.factor((datafac$pclass)) #To check that the variable is a factor:
levels(datafac$pclass) #To discover the names of the factor levels:
levels(datafac$sex)

# Only == and != operators can be used for comparing factors.
# Also, a factor can only be compared to another factor with an identical set of levels:
datafac$sex == datafac$sex
datafac$sex == datafac$pclass

#Generating Factor Levels
# The function gl() (generate levels) is useful when we want to create long vectors of factor levels.
# The syntax for the three arguments is n (number of levels), k (repeat this number of times), length (total length with default n ∗ k).
# Example, to create 5 factor levels with 2 repeats - default length 5*2 = 10:
gl(5,2)     # Example, to create 5 factor levels with 2 repeats - default length 5*2 = 10:
gl(5,2,20)

# Text can also be used for the factor levels:
gl(3,2,12, labels = c ("Low", "Medium", "High"))

# Mid Lesson Question
# From the df_x data frame in page 8, let’s print the column names having at least one NA value:
MissingColumns <- names(df_x)[apply(df_x, 2, anyNA)]
print(MissingColumns)

# Conversion Functions in R
# Conversion functions for data types

# is.numeric()and as.numeric() are for real numbers:
# is.numeric() is used to test if an object is numeric or not.
# as.numeric() converts object into numeric values.
x <- c('1','2','3'); x
is.numeric(x)
x <- as.numeric(x); x
is.numeric(x)

# is.integer()and as.integer() are for integers:
# is.integer() is used to test if object is an integer or not.
# as.integer() converts any object into integer values.
x<- c(1.3, 5.6, 55.6); x
is.integer(x)
x<- as.integer(x); x
is.integer(x)

# is.logical()and as.logical() are for logical values:
# is.logical() is used to test if object is a logical value.
# as.logical() converts any object into logical values.
x <- c(0,5,33,0,1); x
is.logical(x)
x <- as.logical(x); x
is.logical(x)

# is.character()and as.character() are for characters and strings:
# is.character() is used to test if an object is a character or not.
# as.character() converts object into character values.

x <- c(1.3, 5.6,55.6); x
is.character(x)
x <- as.character(x); x
is.character(x)

#is.data.frame()and as.data.frame() are for data frames:
# is.data.frame() is used to test if an object is a data frame or not.
# as.data.frame() converts object into data frames.

x <- list( X=c('a', 'b','c'),
           Y=c('e','f','g'),
           Z=c('h','i','j'))
is.data.frame(x);x
x <- as.data.frame(x); x
is.data.frame(x)

# is.vector()and as.vector() are for vectors:
# is.vector() is used to test if object is a vector.
# as.vector() converts any object into vectors.
x <- gl(2,3);x
is.vector(x)
x <- as.vector(x); x
is.vector(x)

#Other functions for conversion are:
# is.matrix()and as.matrix().
# is.list()and as.list().
# is.factor() and as.factor().

##Data Transformation

#  Data transformation is a key part of working in data analysis.
# R provides some tools for transforming data, which is supported using the dplyr package,
# core member of the tidyverse package library(tidyverse).
# We will use the flights data from the nycflights13 package:
install.packages("nycflights13")
library(nycflights13)
??nycflights13

# flights is a newyork flight data in 2013.
# flights is a tibble (a special type of data frame used by the tidyverse).
# They are designed for large datasets and only show the first few rows and only the columns that fit on one screen.

## dplyr Basics and Pipe# The dplyr functions will allow us to perform most of our data manipulation.

# Also - x |> f(y) |> g(z) is equivalent to g(f(x, y), z).
# flights |> function(dest == "IAH") is similar to function(flights,   dest == "IAH").

##Arrange

# arrange() arranges the observations in order - takes a column name or a set of column names as arguments.
# For multiple column names, each additional column breaks ties in the values of preceding columns.
# flights |> arrange(year, month, day, dep_time)
# desc() can be used on a column inside of arrange() to reorder in descending order.
# flights |> arrange(desc(dep_delay))

flights
flights |> arrange(year, month, day, dep_time) 
flights |> arrange(desc(dep_delay)) 
dplyr::arrange #from stack overfloww

## filter()
# filter() allows us to keep rows by applying conditions to columns.
# The conditions must be true to keep the row.
flights |> filter(dep_time > 180) #To find all flights that departed more than 180 minutes late.
flights |> filter(month == 12 & day == 31) #To find all flights that departed on December 31.

#distinct() finds all the unique rows and can be used to find distinct combination of some columns.
flights |> distinct() #To remove any duplicate rows:
flights |> distinct(origin, dest) #To find all unique origin and destination pairs.
#To retain all other columns of all unique origin and destination pairs:
flights |> distinct(origin, dest, .keep_all =TRUE)
#To count number of occurrences for all unique origin and destination pairs:
flights |> count(origin, dest, sort =TRUE)

#Re-installing tiddyverse package to fix issues #STACKOVERFLOW HELP
install.packages('tidyverse', dependencies=TRUE, type="source", repos="https://cloud.r-project.org")
library(tidyverse)
library(nycflights13)  

## select()
# select() allows us to focus on specifics based on the names of the variables:

flights |> select(year,month,day) #Select columns by name
flights |> select(year:day) #Select all columns between two columns.
flights |> select(!year:day) #Select all columns except.

#Mid-Lesson Question
# From the flights data, select all columns that are of character data type:
flights |> select(where(is.character)) ##select all columns that are of character data type:

# Mutate
# mutate() allows us to add new columns that are calculated from the existing columns.
# Let us compute how much time a delayed flight made up in the air:
flights |> mutate(gain = dep_delay - arr_delay) #mutate() adds new columns on the right side by default.

#.before and .after arguments can be used to place the new column at specific locations using indices or variable names:
flights |> mutate(gain = dep_delay-arr_delay, .before = 1)
flights |> mutate(gain = dep_delay - arr_delay, .after=month)


## Find Week 5 on Week 5.R script.
