## WEEK 2 - Introduction to R syntax, Objects, and Data Types


#creating objects and checking the data type of the object
v <- TRUE #Logical Data type
print(class(v))

v <- 16.7 #Numeric Data Type
print(class(v))

v <- 22L #Integer Data TYpe
print(class(v))

v <- 6.3 - 7i #Complex Data Type
print(class(v))

v <- "data" #Character Data Type
print(class(v))

v <- charToRaw("Hello") #RAW Data type
print(class(v))

## VECTORS: 
# the c() function is used to create a vector
# create a vector and display the character type
vec <- c(2,4,5,6,8,10)
print(class(vec))
vec

char_vec <- c("a", "bee", "dog", "object")
char_vec
class(char_vec)

# Extracting elements of a vector
# we can read or manipulate the contents of a vector using subscripts or indices
# Indices involves the use of square brackets [ ] - referring to the position in a
vector.
# Elements are indexed left to right -from the first, second and so on.
# From our vector:
  vec[3] #To extract the third element of vec (which is a 5)
 vec[44]  

#To extract multiple values - 2nd, 4th and 6th, we use a vector to select the indices in either of the ways below:
ind <- c(2,4,6); vec[ind]
vec[c (2,4,6)]; 

# Values can be removed from a vector using negative indices:
vec[-1]; vec[-3]

# Sequences of numbers can also be used to extract values
vec[3:6]

vec[vec %% 2 == 0] #even-numbers in a vector can be extracted using the Modulo %%
vec %% 2 #display Boolean value of even numbers in the vector

#working with Logical Indices
#For a vector
x <- 1:20; x
sum(x) # We can add all of its elements

# We can count the number of elements that passed some logical test.
x < 8
sum(x < 8) # If we want to determine how many of the values are less than 8

x[x < 8] #extract elements of x that pass the logical condition < 8
sum(x[ x < 8 ])
z <- c (4, 2, 4, 5, 4, 7, 8, 9, 12 ,1, 10); z
sort(z) #First sort() the vector z:
sort(z, decreasing = TRUE) #sort z in decreasing order to get highest value first
sort(z, decreasing = TRUE)[1:3] #Extract the first three elements:
sum(sort(z, decreasing = TRUE)[1:3]) #add up the values of the first three elements:
z #Clearly, we have not changed the vector z in any way.

# find out the position of the max and min in a vector
which(z == max(z))
which(z== min(z))
# quicker built-in function to check
which.max(z)
which.min(z)

##Vector Tables
#TABLE FUNCTION

# To see how it functions, let’s create a vector tally which is made up of 20,000 random integers from a -ve binomial distribution:
tally <- rnbinom(20000, mu=1, size = 1.5)
tally[1:20] # A look at some of the values of vector tally:
table(tally) #table function showing the occurrence of each value

table(z) #table function showing occurrence of elements in z variable

#Vectors - Unique() function
# Let’s look at a vector names:
names <- c("Tayo", "Cynthia", "Musa", "Tayo", "Cynthia", "Musa", "Cynthia")
table(names) #Each name appearance can be seen using
unique(names) #unique() function can be used to extract unique names in the order the name appears

#Duplicated. Displays duplicated elements
duplicated(names) #This depends on if the name has appeared already before:
names[!duplicated(names)] #shows non duplicated names. '!' is called reverses and it's a logical value

#Mid-Lesson Question
#statement creating a vector with values from 1 to 5, incremented by .2 for each iteration
print(seq(1,5,0.2))


# ARRAYS
# An array is a multi-dimensional object with all having the same class
# The dim argument specifies the dimensions of an array
# A three-dimensional array consisting of 36(1:36) numeric with dim 3 (row) x 4(column) x 3(table/dimension)
X <- array(1:36, dim = c(3, 4, 3)); X
X <- array(1:36, dim = c(3, 3, 4)); X

# Like vectors, we can extract the contents of an array using indices.
# When we have two indices [3, 4], the first refers to the row number and the second to the column number.
# A powerful indexing tool in R, is when an index appears as a blank but means ’all of’.
# [, 4] - all rows in column 4 and [2, ] - all columns in row 2 of an array.


#Arrays - Indexing
# When we have an array with three dimensions, we use more indices:
X[2,3,3] #first,we looked at the third table/dimension, second row, and third column.
X[, 3, 4] # next,we looked at the fourth table/dimension, all rows, and third column.
X[2,1:2,2] # lastly,we looked at the second table/dimension, second row, and column one and two.

# MATRICES
# A matrix is just a two-dimensional array which can be created using:
X <- matrix(1:9, nrow=3); X
# Numbers are entered column-wise by default.
# The class and aributes show that X is a matrix of 3 x 3:
class(X); attributes(X)

#To make numbers entered row-wise:
X <- matrix(1:9, byrow=T, nrow=3); X
t(X) # The transpose of a matrix can be computed using t() function:

#Naming Rows and Columns
# Matrices use numbers in naming their rows and columns.
# If we wanted to label the rows Row.1, Row.2, etc
# The function rownames() is used:
#do.Null = False tells R not to create new row names as we add a prefix to the exiting ones using the prefix argument
rownames(X) <- rownames(X, do.NULL = FALSE, prefix = "Row."); X

#Naming Columns
#For the columns, we want to supply a vector of different names:
city <- c("Lagos", "Accra", "Nairobi")
colnames(X) <- city; X

#performing Calculations on the row and columns
rowSums(X) #sum of the rows
colSums(X) #sum of the columns
rowMeans(X) #mean of the summed rows
colMeans(X) #mean of the summed columns


#performing calculations on the row and columns using apply() function
#where MARGIN is either 1 for rows or 2 for columns
#other functions like mean, sample, sqrt, max, min can be assigned to the argument FUN
apply(X, MARGIN = 1, FUN = sum)
apply(X, MARGIN = 2, FUN = sum)

# creating Additional Rows and Columns using rbind() and cbind () function.
X <- rbind (X, apply (X, 2, mean))
X <- cbind(X, apply (X, 1, sd )) ; X

#Naming the added Rows and Columns
# We labeled the 4th column as “stand_dev” and the 4th row as “mean”
colnames(X)[4] <-"Stand_dev"
rownames(X)[4] <- "Mean" ; X

#Restructuring Arrays
#there are situations when we choose to reorder the dimension of an array
X <- array (1:36, dim = c(3,3,4)); X

#we give names to the rows, columns and tables of the array using dimnames()
dimnames(X)[[1]] <- c("male", "females", "non_binary") ; X       # Gender
dimnames(X)[[2]] <- c("Gen X", "Gen Y", "Gen Z")      ; X        # Age Group
dimnames(X)[[3]] <- c("A_Tab", "B_Tab", "C_Tab", "D_Tab") ; X      # Cities
dimnames(X)
X

#EXERCISE: 
# Using the aperm () function
# Restructure the array X in the previous slide by grouping the three
# age groups (X-Z) to be the rows and the four cities group (A-D) to be the columns in each tables as the Genders
# specify the age, cities and gender as a vector argument in terms of the order of their dimensions
aperm(X,c(2,3,1)) #find more about aperm() function
?aperm

# LISTS
# Lists are key objects in R as they are a new way of getting around combining Objects of different classes
# A numeric vector, a logical vector and a character strings vector
X <- c(3,3.4,5.3,4.2,4.8); X
Y <- c(TRUE,FALSE,TRUE,FALSE); Y
Z <- c("Abuja", "Newyork","London","Paris"); Z

# These vectors can not be combined together as they are of different lengths and classes
# Despite their diferences, we can still combine them together as one using list().
things <- list(X,Y,Z); things

# Indices on vectors, matrices, and arrays use one set of square bracket but indices on lists have double square brackets [[1]] or [[3,2]]
# To extract one of the objects in X we use subscript [[1]]
things [[1]]; things[[3]]

#To extract the second element in Z, then we use single indices after the double indices:
things[[3]][2]
things[3][2] #if done without the double indices it results in error

#INDEXING TAGGED LISTS
# The element names operator $ is another method of indexing in R.
# This requires elements of the list to have names.
names(things) #our list things has no names

#Names are then assigned to elements of a list in the function that creates them.
#elements of the list can then be extracted

things <- list(a=X, b=Y, c=Z); things

# $ naming operator can be used to easily index and tag our list instead of using the things[[1]] function.
things$a; things$b; things$c

# List Functions: lapply()
# lapply() function applies a function to each element in the list.
# To know the length, class, mean etc. of each of the vectors making up the list:

lapply(things, length)
lapply(things, class)

# Summary() function can also be used with lists
summary(things)


#INTERACTIVE LEARNING - Attributes and Metadata
#attributes e.g.1
xax <- 1:5
attr(xax,"description") <- "A simple vector" ;xax
attr(things, "Properties") <- " Numeric, Boolan and String vector"; things

#Metadata eg.2
ya <- 10 
attr(ya,"source") <-"Genertated in Lab"; ya

#example 3
#creating a vector y with values from 1 to 10
yb <- (1:10)

#adding a custom attribute "source" to the vector
attr(yb,"sourced") <- "Generated in lab"

#printing the vector and its attribute
print(yb)
print(attr(yb,"source"))

#Names and Dimensions

# Create a vector
my_vector <- c(10,20,30,40,50)

# Assign names to the vector elements
names(my_vector) <- c("first", "second", "third", "fourth", "fifth")

# Print the vector names
print(my_vector)

#Dimension

my_matrix <- matrix(1:6, nrow=2, ncol=3) # Create a matrix
print(my_matrix) # Print the original matrix

# Change the dimensions of the matrix to 3 rows and 2 columns
dim(my_matrix) <- c(3,2)
print(my_matrix) # Print the matrix with updated dimensions


## Find Week 3 on Week 3.R script.