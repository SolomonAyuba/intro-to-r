# WEEK 8:Advanced Data Structures        
## Sat 13 July 2024               

# Text and character strings
# We have seen that we can create data objects made up of only characters.
# In R, character strings are defined by double quotation marks:

x <- "abc"
y <- "123"
class(x)
class(y)

# Numbers can be coerced to characters, 
# but non-numeric characters cannot be coerced to numbers:

as.numeric(x)
as.numeric(y)

# Text and character strings
# One confusing thing about character strings is the clear distinction between 
# the length (length())of a character object and the numbers
# of characters (nchar()) in the strings that comprise that object.
# An example to illustrate this distinction:

animal <- c("squirrel", "hedgehog", "sloth", "rabbit", 'dog')
# Here, animal is a vector comprising five character strings and the individual
# character strings have 8, 8, 5, 6, and 3 characters, respectively:

length(animal)
nchar(animal)

# There are built-in vectors that contain the 26 leers of the alphabet in 
# lowercase (letters) and uppercase (LETTERS):

letters 
LETTERS 

# For the purposes of printing, we might want to suppress the quotes that appear 
# around character strings using noquote():

noquote(letters)
noquote(LETTERS)

# Concatenating strings
# In R, we can concatenate individual strings into vectors of character
# information:

c(x,y)

# Above, the combination function produces a vector of two strings.
#  To convert the two 3-character strings into one 6-character string,
# the paste() function is used:

paste(x,y, sep ="")
paste(x,y)

# The argument, sep = " ", means that the two character strings are to be 
# pasted together without any separator.
# The default for paste() is to insert a single blank space, in between the 
# strings.
# Also, we do not lose blankspaces that are within strings when we use the 
# sep = "" argument in paste():

paste(x, y, " welcome to R Programming", sep = "")

# If a vector is one of the arguments to paste(), each of the elements of the 
# vector is pasted to the specified character string to produce an object of 
# the same length as the vector:
d <- c(x, y, "a2c")
e <- paste(d, " welcome to R Programming", sep = "")
e

# Extracting strings
# The substr() function is used to extract substrings of a specified number
# of characters from within a character string.

# Let’s extract the 1st, the 1st and 2nd, the 1st, 2nd, and 3rd, ... till
# the first 10 characters of a string:

phrase <- "welcome to R Programming"
phrase
x <- character(15) # To create an empty string
x
for (i in 1:length(x)) { 
  x[i] <- substr(phrase, 1,  i)
}
x

#  The second argument in substr() is the number at which extraction is to
# begin and the third argument is the number at which extraction is to end .

# Counting things within strings
# To count the total number of characters in a string, we use the nchar():
nchar(phrase)

# There are 24 characters including the blanks in the phrase.
# Let’s count the numbers of occurrence for each individual characters.
# First, we split up all the character string into individual characters:

strsplit(phrase, split = "")

# We can apply table(), to count the number of occurrences of each:
table(strsplit(phrase, split = ""))

# We could see that there were three blanks within the string phrase, although 
# the heading not surprisingly is also blank.

# To count the number of words in the string, given that this will be one more 
# than the number of blanks (ensure no leading or trailing blanks):
no_words <- 1 + table(strsplit(phrase, split=""))
no_words

# Let’s also determine the length of each word in the string - 
# first separate words:
#   The second argument says to split wherever a blank is encountered.

strsplit(phrase, " ")

# Upper and lower case text
# To work out the length of each word, we apply nchar() using lapply() 
# on each word which are separated using strsplit():

lapply(strsplit(phrase, " "), nchar)

# To switch between upper and lower cases, use the toupper () and 
# tolower () functions:

toupper(phrase)
tolower(phrase); tolower(toupper(phrase))


# Mid-lesson Questions
# Using the character string phrase, reverse the character string 
# (To reverse a character string - first we break up the string into 
# individual characters, then reverse their order, then paste them all
# back together again).

strsplit(phrase, "")
lapply(strsplit(phrase, ""), rev)
sapply(lapply(strsplit(phrase, ""), rev), paste, collapse = "")

# Pattern Matching
# Let’s look at the data frame below with character strings:
country_df <- read.csv("countries.csv", check.names = FALSE)
head(country_df)
tail(country_df)
Country <- country_df$Country
length(Country)
# From the 163 countries in the dataframe, the idea is that we want to be able 
# to extract subsets of countries on the basis of specified paerns within 
# the character strings.

# The grep() function enables the search for matches to a pattern in its 
# first argument within the character vector specified in its second argument.

# It returns a vector of indices within the vector its second argument, 
# where the pattern was found in whole or in part.

# Pattern matching is easy to grasp but requires simple & concrete examples.

# First, let’s extract all the countries containing a particular letter – ‘Z’:

grep("Z", Country)
Country[grep("Z", Country)]
grep("Z", Country, value = T)
# Let’s restrict the search to countries whose first name begins with ‘B’,
# we use the ^ character:
Country[grep("^B", Country)]

# Countries where the first leer of their second
# or subsequent names start with a particular letter:

Country[grep(" F", Country)]
Country[grep(" Z", Country)]

# Countries with names ending a particular letter, we use the $ symbol:
Country[grep("Y$", Country)]

# For conditions to be expressed as groups, use square brackets [ ] 
# inside the quotes to indicate the range of values that is to be selected.
# Countries with two or more names, just search for a blank:
Country[grep(" ", Country)]
country_df

#To extract countries with names letters from B to D:
Country[grep("[B-D]", Country)]

#To extract countries starting with containing letters from B to D: 
Country[grep("^[B-D]", Country)]

# To extract countries not ending with a specified patterns - we use negative 
# subscripts to drop the selected items from the vector.
# Countries with ‘A’ as their second letter are specified by
# ^ .A - ^ means ‘starting’, a single dot means any kind of character, 
# so A is the specified second character.

Country[grep("^[.A-]", Country)]

# Substituting text within character strings
# Search-and-replace operations are carried out using the sub() and gsub().
# The two substitution only in that sub() replaces only the first occurrence 
# of a paern, whereas gsub() replaces all occurrences.
# Both come from the same family of functions as grep().
# Here is a vector comprising six character strings:

cities <- c("lagos", "accra", "capetown", "london", "hongkong", "tokyo",
            "hollandh")

# We want to replace all lowercase ‘h’ with uppercase ‘H’:
gsub("h", "H", cities)

# To replace the first occurrence of a lowercase ‘o’ into an uppercase ‘O’.
sub("o","O", cities)


# More general patterns can be specified in the same way we did for grep().
# To capitalise the first character in each string:
# Make sure to install the "stringr" pacakge 
str_to_title(cities)

#grep() can also be utilized as below:
Country[grep("Z", Country)]
grep("Z", Country, value = T)



# Handling Date and Time in R
# The measurement of date and time is highly peculiar.

# Successive years start on dierent days of the week. There are months with
# dierent numbers of days. Leap years have an extra day in February.
# Americans and Europeans place the day and the month dierently: For the 
# former,3/4/2006 represents March 4, while for the laer, it signifies April 3.

# Calculations involving times are complicated by the operation of time zones
# and daylight saving schemes in dierent countries.

# Fortunately, R has a special representation for dealing with the complexity 
# of dates and times.
# Let’s take a look at how R handles dates and times.

# We would be using functions within the Base R and lubridate packages 
# (library(lubridate)) to explore date and time in R.
#  Dates are stored internally as the number of days since 
# 1970-01-01 while times are stored internally as the number of seconds 
# since 1970-01-01.

library(lubridate)
# Let’s look at the current date For the current date, Sys.Date() and today():
Sys.Date(); today()

# For the current date, time and the timezone  Sys.time() and now():
Sys.time(); now(); now(tzone = "GMT")
# In now(), we can specify the timezone using the tzone argument.

# Mid-lesson Question
# From the current date and time:
# A.check whether the current time occurs in am or pm?
# B.check whether the following years-2020, 2022 & current date are leap years.

am(now())
pm(now())
leap_year(2020)
leap_year(2022)
leap_year(Sys.time())


# Date classes and conversion
# Dates are represented by the Date class and can be coerced from a character
# string using the as.Date() function.
class(Sys.Date())

# The Date class represents calendar dates - internally, this is an integer.

# The unclass() function shows how dates are stored internally as the number 
# of days since 1970-01-01:
origin
unclass(Sys.Date())

# To create Date objects:
## Coerce a Date object from a character string
X_date <- as.Date("2023-09-12")
X_date
unclass(X_date)

# Date conversion and ISO 8601
# How are dates before the origin stored?.
## The independence date of Nigeria 
unclass(as.Date("1960-10-01"))

#Dates older than the origin are stored as negative integers.

#  The as.Date() can also be used to convert numeric to a Date object by 
# specifying the origin and number of days since it:
as.Date(18425, origin = "1970-01-01")

# If you have noticed, the format returned by date functions is the same i.e. 
# YYYY-MM-DD. It includes the year, the month & the day.

# The default format used in R is the ISO 8601 standard for date/time. 
# ISO 8601 is the internationally accepted way to represent dates and times. 
# It uses the 24 hour clock system.

# ISO 8601
# Let us create a release date using the ISOdate() function:
ISOdate(year = 2024,
        month = 7,
        day = 14,
        hour = 1,
        min = 20,
        sec = 5,
        tz = "GMT")

# We will further look at all the dierent ways in which date/time are
# specified in the real world.

# Time classes - POSIXct & POSIXlt
# Times are represented by the POSIXct or the POSIXlt class:
class(now())

# now() returns current date/time as a POSIXct object - POSIX stands for 
# Portable Operating System Interface.It is a family of standards specified for 
# maintaining compatibility between dierent operating systems.

# The unclass() function shows how times are stored internally as the number 
# of seconds since 1970-01-01:

unclass(now())

#  POSIXct represents the number of seconds since the beginning of 1970 (UTC) 
# and ct stands for calendar time.

# as.POSIXct() is used to store date/time as POSIXct objects:
X_date <- as.POSIXct("2024-07-14 01:20:05")
class(X_date)
unclass(X_date)

# POSIXlt which stands for local time represents the following in a list:
# seconds - sec, minutes - min, hour of the day - hour, day of the month - mday,
# month of the year (0-11) - mon , years since 1900 - year, day of week - wday, 
# day of year - yday, daylight saving time flag 
# - isdst, time zone - zone, oset in
# seconds from GMT - gmtoff.

# as.POSIXlt() is used to store date/time as POSIXlt objects:
X_date <- as.POSIXlt("2024-07-14 09:30:05")
class(X_date)

# POSIXlt stores date/time components in a list and these can be extracted.
# Let us look at the components returned using unclass():
unclass(X_date)

# unlist() can be used to return the components as a vector:
unlist(X_date)

# Mid-lesson questions
# Extract the following from the X_date Date object (POSITlt class) :
#   Month of the year, Day of week, Timezone, Hour of the day, Minute

X_date$mon
X_date$mday
X_date$zone
X_date$hour
X_date$min

# Things to note when creating/dealing with Date/TIme:
# use Date when there is no time component.
# use POSIX when dealing with time and timezones.
# use POSIXlt when you want to access/extract the different
# components.

# Date Arithmetic
# Let’s determine the duration of the "Introduction to R Programming" 
# course you've enrolled in by subtracting its start date from its end date:

start_date <- as_date('2024-05-13')
end_date <- as_date('2026-04-13')
duration <- end_date - start_date
duration

# We can also shift a date by days, weeks or months:
start_date + days(4)
start_date - days(4)
start_date + weeks(2)
start_date - weeks(2)
start_date + years(1)
start_date - years(1)


# Time Zones
# Time Zones exist because dierent parts of the Earth receive sunlight at 
# dierent times. The time zones are based on Earth’s rotation - The Earth is
# divided into 24 time zones.

# Coordinated Universal Time (UTC) is the time standard commonly used across 
# the world. It shares the same current time with the Greenwich Meridian Time 
# (GMT) - Important to note that GMT is a timezone while UTC is a time standard:

now(tzone = "GMT")
now(tzone = "UTC")

# We can view our current timezone using Sys.timezone():
Sys.timezone()


# Daylight Savings
# Daylight savings also known as daylight savings time or summer time is the 
# practice of advancing clocks during summer months so that darkness falls later 
# each day according to the clock.

# It involves advancing the clock by one hour in spring (spring forward) and 
# reducing the clocks one hour in autumn (fall back).

# In R, the dst() function is used to see if daylight savings is in effect. 
# It returns TRUE if daylight saving is in force,FALSE if not and NA if unknown.
Sys.Date()
dst(Sys.Date())


# Date & Time Formats
# The ISO 8601 format is a good practice, but not all date/time data will 
# comply with it as date/time data come in dierent types of formats:

#   September 12, 2023 12th Sep, 2023 Sep 12th, 23 1 2-Sep-23 12/09/23
# In R, when the data is not in the default ISO 8601 format, we have to specify
# the format.

# We do this by using conversion format codes which is introduced by %, 
# followed by a single letter.

# Date & Time Formats
# Let look at date in the format 23/09/12. In this format, the year with only 2 
# digits comes first followed by month and the date; each separated by a
# slash (/).

# To map each component of the date to the appropriate format codes:
#   A. 23 - %y; 09 - %m; 12 - %d

# Using the format argument, we will specify the format codes as a character 
# in quotes:
as.Date("24/07/14", format = "%y/%m/%d")

# Let look at another date in the format 2023-Sep-12. In this, the appropriate 
# format codes will be: - 2023 - %Y; 09 - %b; 12 - %d
# Using the format argument, we will specify the format codes as:

as.Date("2024-Jul-14", format ="%Y-%b-%d")

#Mid-lesson questions
# Using the release date/time of R 4.3.1 released on June 16, 2023 14:13:23 UTC, 
# specify the right format argument.
# Since we are dealing with both date and time, we use POSIXct():

as.POSIXct("July 14, 2024 01:53:23", tz = "UTC", format = "%B %d, %Y %H:%M:%S")

# Parse Date & Time
#  In most cases, we would not create date/time but instead we work with 
# existing date/time.

# In these cases, we need to be able to parse date/time from the data.
# We will focus on parsing date/time from character data and use the
# strptime() function to convert character data to date/time data.

# As an example, the data we have been supplied has date/time as character 
# data and in the format YYYYMMDD -we will use strptime() to convert this to an 
# object of class POSIXlt:
X_date <- strptime("20240715", format ="%Y%m%d")
class(X_date)

# Reading time data from files
# It is most likely that our data files contain dates in Excel format.
# Let’s look at an example by reading a file:
## Enable/install the 'readr' package before running this part

business <- read_csv("businessexcel.csv")
business
head(business)
class(business$Invoice)
class(business$Due)
class(business$Payment)
# We can clearly see that the dates are character string which have to be 
# converted to dates:

Rdate <- strptime(business$Due, "%d/%m/%Y")
class(Rdate)
business$Due_Date <- Rdate
head(business)

# Date & Time Components
# In conclusion, there are other functions that can be used to extract 
# components such as year, month, day, minutes, second, etc, from date /time. 
# Below are examples of such functions:

# A. year(), month(), month(label = TRUE), month(abbr = FALSE), B. months(), 
# week(), day(), mday(), wday(), qday(), day(),
# C. weekdays(), days_in_month(), hour(), minute(),
# D. second(), seconds(), quarter(), quarters(), semester(), etcleap_.



## Find Week 9 on Week 9.R script.


## Interactive Learning - Apply Functions for Element-Wise Operations
# The ‘apply()’ Function in R
# The ‘apply()’ function in R is one of the cornerstones of data manipulation, 
# and it comes in very handy when dealing with matrices. The function allows you 
# to apply a function either row-wise or column-wise. Here's the basic syntax:

# Creating a 3x3 Matrix 
# Let's see this in action with a simple example. Creating a 3x3 Matrix
# First, let's create a 3x3 matrix.

mat <- matrix(1:9, nrow = 3)
mat
# applying a function row-wise
# calculate the sum of each row
row_sums <- apply(mat, MARGIN = 1, FUN = sum) 
# MARIN = 2 (is for columns); FUN is the function to be applied.
row_sums

# Applying a Function Column-wise
# Similarly, to apply a function to each column, use ‘MARGIN=2’.
col_sums <- apply(mat, MARGIN = 2, FUN = sum)
col_sums

# Implementing with actual codes.
real_mat <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
real_mat

# Sum each row
real_matRSum <- apply(real_mat, 1, sum)
real_matRSum

# Sum each column
real_matCSum <- apply(real_mat, 2, sum )
real_matCSum

# Print results
cat("Row sums are: ", toString(real_matRSum), "\n")
cat("Columns sums are: ", toString(real_matCSum), "\n")

# The ‘lapply()’ Function in R

# In R, the `lapply()` function is one of the important members of the apply 
# family of functions. It applies a given function to each element of a list and
# returns a list as well. The basic syntax of the function is as follows:
# lapply(X,FUN,..) 
# - `X`: The list or vector that will be processed.
# - `FUN`: The function that will be used for processing.
# - `...`: Any extra arguments that need to be passed to `FUN`.

# Creating a Simple List
# 
# Let's start by creating a simple list: 

my_list <- list(1,4,9)
print(my_list)

# Applying a Function to Each Element
# To apply a function to each element of the list, you can use:
# Apply the square root function to each element of my_list 

sqrt_list <- lapply(my_list, sqrt)
print(sqrt_list)

# ‘sapply()’ Function
# The ‘sapply()’ function is an optimised version of ‘lapply()’ that tries to
# simplify the output to a more "user-friendly" data structure, such as a vector 
# or matrix. This is particularly useful when you do not want the 
# function's output to be in list form but prefer a simpler data structure.

#e.g Consider a list with the numbers 1, 2, and 3.
# Using lapply
result_lapply <- lapply(list(1,2,3), sqrt)
print(result_lapply)

# Using sapply()
result_sapply <- sapply(list(1,2,3), sqrt)
print(result_sapply)

# As you can see, `sapply()` returns a vector instead of a list.

# How to use ‘sapply()’
# The basic syntax is almost identical to ‘lapply()’:
#   sapply(LIST, FUNCTION, ...)
# 1. ‘LIST’: The list or vector to be manipulated.
# 2. ‘FUNCTION’: The function to be applied to each element of the list.
# 3. ‘...’: Additional arguments to pass to the function.


# ‘mapply()’ Function
# 
# The ‘mapply()’ function in R is a multivariate version of ‘sapply()’. This
# function applies a function in an element-wise fashion to each corresponding
# element of multiple lists. The signature of the ‘mapply()’ function is quite 
# straightforward:

# mapply(
#   FUN,            # 1. The function to apply.
#   ...,            # 2. The list(s) or vector(s) of values to manipulate.
#   MoreArgs = NULL,  # 3. A list of other arguments to 'FUN'.
# SIMPLIFY = TRUE, #4.Logical. Should the result be simplified? Default is TRUE.
#   USE.NAMES = TRUE    # 5. Logical. Should the names be preserved?
# )

# To make the concept of ‘mapply()’ concrete, let's consider two lists, 
# ‘list1’ and ‘list2’.

list1 <- list(1,2,3)
list2 <- list(4,5,6)
result <- mapply(sum,list1,list2)
print(result)


# Real-World Application: Weather Dataset Analysis with ‘apply()’
# When working with complex, real-world datasets such as weather data, 
# the ‘apply()’ function can be a powerful tool for summarising columns. 
# Here's how you can use ‘apply()’ to find the mean, minimum, and maximum 
# of each column in a weather dataset.

# Example
# 
# Suppose you have a weather dataset `weather_data` with columns 
# "Temperature", "Humidity", and "Wind Speed".

weather_data <- data.frame(Temperature = c(20,25,30,35,40), 
                           Humidity = c(50,55,60,65,70),
                           Wind_Speed = c(10,15,2,25,30))
weather_data
# Calculate the mean of each column
weather_mean <- apply(weather_data, 2, mean)
print(paste("Mean values: ", weather_mean))

# Calculate the minimum of each column
min_values <- apply(weather_data, 2, min)
print(paste("Minimum value: ", min_values))

#Calculate the maximum of each column
max_value <- apply(weather_data, 2, max)
print(paste("Maximum value: ", max_value))

# ‘apply()’ Function
# This function operates on the rows or columns of a matrix. 
# The syntax is ‘apply(matrix, 1 or 2, function_name)’.
# 
## mat <- matrix(1:9, nrow = 3)
## apply(mat, 1, sum) # Sums each row

#‘lapply()’ Function

# This function operates on the rows or columns of a matrix. The syntax is 
# ‘apply(matrix, 1 or 2, function_name)’.
## lapply(list(1, 2, 3), sqrt) # Calculates the square root of each list element


#‘sapply()’ Function
#This function simplifies the output of ‘lapply()’ to a vector or matrix when 
# possible.
# sapply(list(1, 2, 3), sqrt) # Returns a vector instead of a list


# ‘mapply()’ Function
# 
# This function is used for element-wise operations on multiple lists. 
# 
# mapply(sum, list(1, 2, 3), list(4, 5, 6)) # Adds corresponding elements in two 
# lists


## Find Week 9 on Week 9.R script.