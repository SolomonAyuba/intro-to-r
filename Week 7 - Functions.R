# WEEK 7: Functions in R						          
## Sat 22 June 2024


# Functions are created by using the keyword function - function().
# The basic syntax of a function definition in R is as follows:
# function_name <- function(arg1, arg2, arg3,...){
#    Function Body}
# Functions are R objects of class “function”.

#This simple function that takes no arguments and does nothing.
func <- function(){
  # This function does nothing
}

class(func) # check the class of the function
func() # check the body of the function

# We can create user-defined functions in R, which are specific to what a user
# wants.
# Also, functions can be created and executed with or without arguments.

# Below is an example of how a function can be created without arguments:
func <-  function(){
  for (i in 1:4){
    y <-  i ^3
    print(y)
  }
}
func() #print output

# Create a function to print cubes of numbers in sequence
func <- function(x) {
  for(i in 1:x) {
    y <- i^3
    print(y)
  }
}

func(7) #prints cubes of 7 numbers

# Return Values in function
 
# Create a function without return statement
func <- function(x){
  y <-  x^3
  y
}
func(3)

# Create a function with return statement
func <- function(x){
  y <-  x^3
  return(y)
}
func(3)

formals(func) # Returns a list of all the formal arguments of a function

# Calling Functions: Argument matching

# create a function with arguments
func <- function(x,y,z) {
  result <- x * y + z
  print(result)
}

#  Calling an R function with arguments can be done in a variety of ways.
# functions arguments can be matched positionally or by name.
# Positional matching means that the arguments to a function call can be 
# supplied in the same sequence as defined in the function.
# Name matching means they can be supplied in a different sequence but assigned 
# to the names of the arguments.

# Call the function by position of arguments
func(5,2,11)

# Call the function by names of the arguments
func (y = 3, z = 11, x =5)

# R functions arguments can also called without supplying any argument so as to
# get the default result.
# Also such functions can be called by supplying new values and get non-default
# result.

# create a function with arguments
func <- function(x=3,y=6){
  result <- x*y
  print(result)
}
func() # call the function without giving any argument
func(9,5) # call the function giving new values of the argument

#Lazy Evaluation of Function
# Arguments to functions can be evaluated lazily, which means they are evaluated
# only when needed by the function body.
# Take a look at a the function func() with two arguments: x and y.

func <- function(x7,y7){
  x7^2
}

func(2)

# This function never uses the argument y, so calling f(2) will not produce an 
# error because the 2 gets positionally matched to x.
# It is common to write a function which does not make use of an argument and 
# R never throws an error.

#Another example shows lazy evaluation at work, which eventually result in an 
# error.
func <- function(xx,yy){
  print(xx)
  print(yy)
}

func(4)

# Notice that “4” got printed before the error was triggered.
# This is because y was not evaluated until after print(x).
# When the function tried to evaluate print(y), the function threw an error.


# The ... Argument

# There is the special argument - ... argument, which indicates a variable 
# number of arguments that can be passed on to other functions.
# Mostly, the ... argument is necessary when the number of arguments to be 
# passed to a function cannot be known in advance.
# This is easily noticeable in functions like paste() and cat().
# The function declaration of any function can be easily viewed using args():
args(paste)
args(cat)

# Because both paste() and cat() print out text to the console by combining 
# multiple character vectors together.
# It is impossible for those functions to know in advance how many character
# vectors will be passed to the function by the user:
area <- 4
value <- -5
abs_value <- abs(value)
print(paste("The area of the circle is ", area)) #Two argument are passed
print(paste("The absolute value of", value, " is ", abs_value)) # Three 
# arguments are passed


hello <- function(name, surname){
  # say hello to a person with name and surname
  print(paste('Hello', name, surname))
  }

# Documenting Function

# A good practice when creating functions is to provide documentation on how 
E to use them, especially when writing complex functions
# An informal way of doing it is by adding comments in the body of functions.
func <- function (x,y){
  # A function to calculate and print our the product of two numbers
  result <- x+y
  print(result)
}


# However, if a function is part of a big package and you want to document it, 
# you should write formal documentation in a
# separate .Rd document.
# You see the result of this documentation when you look at the help file for 
# the given function, e.g. ?func.


# Built-in Functions, packages and libraries
# R, has a number of built-in functions, referred to as ‘Base R’.
# These built-in functions are functions that are directly called by user 
# written programs.
# Simple examples of in-built functions are sample(), seq(), mean(), max(), 
# sum() and paste() etc.
# Given R’s open source nature, individuals have wrien useful packages, which
# extend its functionality by providing a number of functions to docommon tasks.
# These R packages are mostly a collection of R functions, compiled code and
# sample data stored under a directory called "library".

# Mid-lesson Questions
# Write a function “cost_price” with arguments “qty” (number of quantity) and 
# “unit_price” (price of each quantity), the function calculates the cost price
# as the product of the number of quantity and the price of each quantity and 
# gives a deduction of 8% for 50 or more quantities sold. Calculate the cost 
# price for 59 quantity of 75$/quantity.

cost_price <- function(qty, unit_price){
  price <- qty * unit_price 
if(qty >= 50) {
  price <- price * 0.92
  }
  return(price)
}
cost_price(59,75)  

# Mid-lesson Questions
# For the matrix “my_mat”, write a function which can return a new matrix which
# contains all the rows without an NA in it and all the columns without an NA 
# in it

my_mat <- matrix(c(3, NA, NA, 4, 5,6,7,9,5,6,7,8), nrow = 3)
my_mat

#A function to return a matrix which rows contains no NAs
mat_func <- function(mat){
  mat[!apply(is.na(mat), 1, any), ]
}
mat_func(my_mat)

# A function to return a matrix which columns contains no NAs
mat_func <- function(mat){
  mat[, !apply(is.na(mat), 2, any)]
}
mat_func(my_mat)


# Binding values to symbols
# Binding Values to Symbol
# How does R know which value to assign to the symbol pi? Why doesn’t it give 
# it the value of pi that is in the stats package?
pi
pi <- 2.5
pi

# When R tries to bind a value to a symbol (variable), it searches through a 
# series of environments to find the appropriate value.
# If the value of an R object is to be retrieved, the order for this to occur 
# are:
 # A. Search the global environment (your workspace) for a symbol name matching
# the one requested.
 #  B. Search the namespaces of each of the packages on the search list.



# The search list can be found by using the search() function.
search()
#  The global environment is always the first element of the search list and 
# the base package is always the last.
# The order maers as there could be multiple objects with the same name in 
# dierent packages - filter() in dplyr and base.
# When a new package is loaded using library() the namespace of that packagegets 
# put in position 2 of the search list and others gets shifted down the list.

# Scoping Rules
# The scoping rules of a language determine how a value is associated with a 
# free or unbounded variable (symbol) in a function.
# In R, the rules are fairly simple but there do exist mechanisms for
# subverting the default rules.
# R uses lexical scoping or static scoping, which is very useful for 
# simplifying statistical computations.
# This means the variable bindings in eect at the time the expression was 
# created are used to provide values for any unbound symbols in the expression.
# The key properties of scoping are involved with evaluating functions and 
# we concentrate on this issue.

# Lexical Scoping
# A symbol can be either bound or unbound.
# All the formal arguments to a function provide bound symbols (a & b) in the
# body of the function.
# Other symbols in the body of the function are either local variables (c) 
# or unbound (free) variables (d).
# A local variable is one that is defined within the function.
# Local variables must first be defined, this is typically done by having them 
# on the left-hand side of an assignment.
 funct <- function(a,b){
   c <- 3
   (a+b-c)/d
 }
 
 
 # During the evaluation process if an unbound symbol is detected then R aempts
 # to find a value for it.
 # In R, the environment of the function is searched first, then its enclosure 
 # and so on until the global environment is reached.
 # After global environment, the search continues down the search list until we
 # hit the empty environment. The value of the first match is then used.
 # If a value for a given symbol cannot be found once the empty environment is 
 # arrived at, then an error is thrown.
 
 # Let’s illustrate lexical scoping:
func <- function(x){
  b <- 5
  y <- function(a) a+b
  return(y)
}

f <- func(a)
f(3)

#  When f(3) is evaluated we see that its body is that of y.
# Within that body a is bound to the formal argument and b is unbound.
# In R using lexical scoping, a will be associated with the value 3 and y with 
# the value 5 local to func so f(3) should return the value 8.


## Find Week 8 on Week 8.R script.
