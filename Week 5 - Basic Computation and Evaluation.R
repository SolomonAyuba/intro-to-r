## WEEK 5 - Basic Computation and Evaluation
## Wed 12 June 2024


#Vectorized Calculations e.g
a <- 1:5
b <- 6:10
c <- a+b
c

a #a variables
b #b variables

# without vectorization, we would have had to do this:
c2 <- numeric(length(a))
for(i in seq_along(a)){
  c2[i] <- a[i] + b[i]
}
c2

# Another operation that can be done in a vectorized manner is logical comparisons.
# So suppose you wanted to know which elements are greater than 3:
a>3

#other vectorized logical operations are:
a>=2
b<8
a==5 | b==9

#Certainly, subtraction, multiplication, division and exponent are also vectorised:
b-a
a*b
a/b
b^a
b**a

#Vectorized element-wise operations
x <- matrix(seq(1,7,2),2,2)
x
y <- matrix(5:8, 2,2)
y
#Element-wise multiplication
x*y
# Element-wise division
x/y
# Element-wise exponent
x^y
# true-matrix multiplication
x%*%y


zz <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
zx <- matrix(c(5,6,7,8), nrow = 2, ncol = 2)
rr <- zz %*% zx
rr

#Solving Simultaneous equations
#In R, simultaneous equations can be converted into a matrix to find the values of the unknown.
# Let’s solve the equation below with three unknowns:
# 6x + 12y + 4z = 70
# 7x - 2y +3z = 5
#2x +8y -9z = 64
A <- matrix(c(6,12,4,7,-2,3,2,8,-9), nrow = 3, byrow = TRUE)
A
bm <- matrix(c(70,5,64))
bm

solve(A,bm)

# Vector Functions - Sets
#R has three functions for set manipulation - union(), intersect(), and setdi().
Set_x <- c(1,2,3,4,5)
Set_x
Set_y <- c(4,5,6,7)
Set_y

#The union of two sets (A ∪ B) as:
union(Set_x, Set_y)

#The intersection of two sets (A ∩ B) as:
intersect(Set_x, Set_y)

#The dierence between two sets is order-dependent.
#Thus, setdiff(Set_x, Set_y) gives a different output to setdiff(Set_y, Set_x).
setdiff(Set_x, Set_y)
setdiff(Set_y, Set_x)

#Sets can also be compared using %in% - this results in a logical vector.
#Its length is the same as that of the vector on the left - this informs us if members of the first set are in the second one or not:
Set_x %in% Set_y

# Midlesson Exercise: The following table gives data for the distance traveled along five truck routes and the corresponding time required to traverse each route. 
dist_mile <- c(560,440,490,530,370)
time_hr <- c(10.3, 8.2, 9.1, 10.1, 75)
#Use the data to compute the average speed required to drive each route. 
#Find the route that has the highest average speed.
av_speed <- dist_mile/time_hr
av_speed
which.max(av_speed)

# Basic exploratory and summary statistics
# Here, we would explore data with R as It is important to explore data before utilising it.
# This gives an idea about the structure of the dataset.
#Let’s create a sample data to be used to demonstrate data exploration techniques:

exp_data = data.frame(Q1 = sample (1:6, 100, replace = TRUE), 
                      Q2 = sample (6:10, 100, replace = TRUE), 
                      Q3 = sample (3:8, 100, replace = TRUE),
                      Q4 = sample (8:13, 100, replace = TRUE))
exp_data
#This program creates random observations with replacement.

#To calculate descriptive statistics using summary() function:
summary(exp_data)

#To calculate the variance (covariance) between columns:
var(exp_data)

#The variable names of the data frame are obtained using names():
names(exp_data)

#Calculate the number of rows and columns using dim():
dim(exp_data)

#To explore the structure of data frame columns using str() function:
str(exp_data)

#To explore the first and last 6 rows of a data frame:
head(exp_data)
tail(exp_data)

#To explore the first and last n rows of a data frame:
head(exp_data, n=5)
tail(exp_data, n=2)

#To explore all rows but the last row
head(exp_data, n=-1)

#To explore all rows but the first row
tail(exp_data, n=-1)

#To select 5 random rows from a data frame using the dplyr package:
library(dplyr)
sample_n(exp_data, 5)

#To select 10% (0.1) random rows from a data frame:
sample_frac(exp_data, 0.1)

#To count NA values by column using colSums() & is.na() functions:
colSums(is.na(exp_data))

#Summary statistics using dplyr
#In the previous slides, we noticed that the dplyr functions that worked with rows and columns.
# dplyr gets even more powerful with its ability to work with groups. 
#Recalling the flights data from the nycflights13 package:

library(nycflights13)
flights

#Summary statistics- group_by()
# group_by() function is used to divide data into groups for analysis.
# To group the flights data by months:
flights |> group_by(month)
#It does not change the data, but you can notice that the output indicates that it is “grouped by” month (Groups: month [12]).

#● We can also group the flights data by months & day:
flights |> group_by(month,day)
# In general, group_by() adds grouped feature to the data frame.

#Summary statistics - summarize()
# The most important grouped operation is a summary, which provides a summary statistic.
# It reduces the data frame to have a single row for each group.
# Let’s obtain a summary statistics of the group by month using mean():
flights |> group_by(month) |> summarize(delay = mean(dep_delay))
#This happened because some of the observed flights had missing data in the dep_delay column.

#The NAs are to be removed before calculating the mean:
flights |> group_by(month) |> summarize(delay = mean(dep_delay, na.rm = TRUE))

#Various useful summaries can be used with the summarize() function: n(), median(), sd(), var() etc..

#Interactive Learning

# Parsing an expression without evaluating it
expr <- parse(text = "2 + 2")

# Checking the type of the parsed expression
expr_type <- typeof(expr)

# Printing the result
print(paste("The type of expr is:", expr_type))

#When you run typeof(expr), it will return "expression,"  indicating that the object is a parsed but unevaluated expression.
#By parsing without evaluating, you can examine the structure of the expression, make modifications, or even generate code dynamically before running it.

#Evaluation

# Define the expression without evaluating it
expression <- parse(text = "2 + 2")

# Evaluate the parsed expression
result <- eval(expression)

# Print the result of evaluating the expression
print(paste("The result of evaluating the expression is:", result))


#Lazy Evaluation
# lazy evaluation. Lazy evaluation defers the computation of an expression until its value is actually needed. This can be particularly useful for optimising performance in your R programmes.
f <- function(X) {
  print("This is a lazy evaluation result")
  return(10)
}

f(print("Argument is evaluated"))

#In R, you can capture an expression without evaluating it using the substitute() function. This can be quite handy when you want to manipulate expressions for meta-programming or debugging. Additionally, you can convert these unevaluated expressions back to strings using the deparse() function for easier handling and visualisation.
#To capture an unevaluated expression, you can use substitute() in the following manner:

expr <- substitute(x+y)
#Here, expr will store the unevaluated expression x + y. You can confirm this by running typeof (expr), which should return "language."
typeof(expr)

#To convert this expression back into a string, you can use deparse().
str_expr <- deparse(expr)
typeof(str_expr)

#Now, str_expr will contain the string "x + y."
str_expr

#Case study
#In this case study, we look at a data scientist who faces the challenge of creating various plots based on different variables and their relationships. 
#Build a dynamic plotting function using R's substitute() and deparse() functions.
#This function takes an unevaluated expression as an argument and dynamically adjusts the plot accordingly.
#The Data scientist will therefore build a function named plot_function as shown below: 
  install.packages("ggplot")
library(ggplot2)

plot_function <- function(expr) {
  expr_string <- deparse(substitute(expr))
  p <- ggplot(mtcars, aes_string(x = "wt", y = expr_string)) + geom_line()
  print (p)
}
plot_function(mpg +hp)

#Here, the plot_function takes an unevaluated expression expr as its argument. The deparse(substitute(expr)) part captures the expression and converts it into a string. This string is then used in aes_string() to set the y-axis dynamically based on the given expression.

install.packages("rmarkdown")
library("rmarkdown")


## Find Week 6 on Week 6.R script.
