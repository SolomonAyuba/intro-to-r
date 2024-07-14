## WEEK 6: Control Structures and Looping	
## Sat 22 June 2024

# Live lesson 
install.packages("tiddyverse")
titanicdata <- read.csv("sampledatatitanic.csv")
titanicdata
class(titanicdata)
head(titanicdata)

5+3-3*6
pi
3**2
3^2
7/3
7%/%3
7%%3
ceiling(4.6232323)
floor(4.5323424)
# Live lesson end



# IF - ELSE statement

#Let’s calculate and display the absolute value of any given number if the number is less than 0.
#First, we can ask for user input using the readline() function, which is then converted to the required data type.
#Let’s calculate and display the absolute value of any given number if the number is less than 0; else, set the action as (‘Please try again’).
value <- as.numeric(readline(prompt = "Enter a number: "))
if (value < 0){ 
  abs_value <- abs(value)
  print(paste("The absolute of ", value, "is", abs_value))
} else {
  print(paste("Number is > 0! Try Again!"))
}

#The value of a variable can also be set depending on whether a condition is TRUE or FALSE.
 x3 <- 2
 y3 <- if (x3>3) {
   10
 } else {
   0
 }
 
 y3

 x4 <- 4
 y4 <- if (x4 >3) {
     10
   } else {
     0
   }
 y4
 
 
 # Mid-lesson question
 # Let’s calculate and display the absolute value of any given number if the number is less than 0; display the action 
 # (‘Please enter a non-zero number’) if the number is equal to 0; else, set the action as (‘Please try again’).
 
 valuex <- as.numeric(readline(prompt = "Enter a number: "))
 # check if the input is numeric
 if (is.na(valuex)){
   print("Invalid input! Please enter a numerica value")
 } else {
   # check for negative value
 if (valuex < 0){
   absolute_value <- abs(valuex)
   print(paste("The absolute value of ", valuex, " = ", absolute_value))
 } 
   # check for zero value
   else if (valuex == 0) {
   print("Please enter a non-zero number")
 } #for positive and other cases
   else {
   print("Please try again!")
 }
 }
 }
 # Switch Statements
 # If you want to select values based on a single condition, best is to use the switch() function.
 # The switch() function allows a variable to be tested for equality against a list of values.
 # Each value is called a case, and the variable being switched on is checked for each case.
 # The syntax for creating a switch statement: switch(expression, case1, case2, case3....)
 # The expression can be either an integer or character.
 
 # Switch statements with string expressions
 # If the expression is a string, switch() will return the value based on the name of the element.
 x5 <- "a"
 v5 <- switch(x5, "a"="austria", "b"="benin", "c"="cape verde")
 v5 
 
 #In the case of multiple matches, the value of first matching element is returned.
 x6 <- "b"
 v6 <- switch(x6, "a"="austria", "b"="benin", "b"="botswana") 
 v6
 
 # The numeric version of switch() returns value by positional matching.
 x7 <- 1
 v7 <- switch(x7, "a"="austria", "b"="benin", "c"="cape verde") 
 v7

 #If there are no unmatched elements present, a NULL is returned
 x7 <- 4
 v7 <- switch(x7, "a"="austria", "b"="benin", "c"="cape verde") 
 v7
  
 # Iteration Loops
 # Loop construction - for, while & repeat Statements
 
 # FOR loop statements
 # Let’s look at the different ways we can print out each element of a vector using for loops
 x <- c("austria", "benin", "ccape verde", "denmark", "egypt") 
 for(i in 1:5) {
   print(x[i])
 }
 
 # or written as
 for(i in seq_along(x)){
   print (x[i])
 }
 
 for(letter in x){
   print(letter)
 }

 # The above three loops all have the same behavior.
 # seq_along() function is used to generate an integer sequence based on the length of an object (x).
 # Also, it is not mandatory to use an index-type variable.
 
 
 # NESTED FOR LOOP statements
 # for loops can be nested inside of each other, which are used for multi- dimensional data structures (arrays, lists).
 x <- matrix(1:12, 3)
 x 
 
 for(i in seq(nrow(x))) {
   for(j in seq(ncol(x))){
     print(x[i, j])
   }
 }
 
 #Care has to be taken when using nested for loops as nesting beyond 2 levels often makes it diicult to read & understand.
 
 # WHILE LOOP statement 
 #  Let’s look at the way we can print out integers from 0 which are less than 10: 
 x <- 0
 while (x < 10) {
   print(x)
   x <- x + 1
 }
 
 # Print out the value of x as long as it is less than 25:
 x <- 3
 while (x < 25){
   print(x)
   x <- 2* x - 1
 }
 
 # REPEAT LOOP and BREAK statements
 # The syntax for this is
 repeat {
   x1 <- function(x0)
   
   if(abs(x1 - x0) < thresh) {
     break
   } else {
     x0 <- x1
   }
 }
 
 # Repeat a set of sequence until x becomes greater than 25:
 x <- 3
 repeat {
   print (x)
   if (x > 25){
     break
   }else {
     x <- 2 * x - 1
   }
 }
 
 # Loops slowness and avoidance
 # To see how slow loops can be, we would be using the functions system.time() and proc.time().
 
 # Let’s compare the time taken to find the minimum number in a vector with and without loops:
 x <- runif (100000000)
 system.time (min(x))

 pc <- proc.time ()
 min_val <- x[1]
 for (i in 2:100000000){
   if (x[i] > min_val){
     min_val <- x[i]
   }
 }
proc.time() - pc

# It is obvious that loops should be avoided wherever possible.

# NEXT statements
# NEXT is used to skip any iteration in a loop:
for (i in 1:15) {
  if(i == 5 | i == 10) {
    ## Skip the 5th and 10th iterations next
  }
  print (i)
  }

## Find Week 7 on Week 7.R script.