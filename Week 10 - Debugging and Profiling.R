# WEEK 10: Debugging and Profiling
## Sun 14 July 2024

x1 <- c(1, 2, na)
x2 <- c(na, na ,na)

any(is.na(x2))

## Common errors in R code
# An example of a warning that occurs when using R:
log(-10)

# This warning informs you that the log of a negative number results in a NaN 
# value as you can’t take the log of negative numbers.

# Yet, R does not give an error, as it can return a useful value, the NaN. 
# The warning let’s us know that something unexpected happened.
 
# Let’s look at function that prints a message to the console depending on 
# its input:

printsign <- function(x){
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
}

# This function prints a message depending on whether x is greater than zero or 
# less than or equal to zero.
# Executing the printsign() function and seeing if we can identify any bugs or
# problems:

x <- as.numeric(readline(prompt = "Enter a number: "))
printsign(x)

#The above works well with no messages, warnings, or errors.

printsign(NA)

# For above, the function first checks if x > 0. Unfortunately, a test can not be 
# done on a NA or NaN value. The code stops with a fatal error as R does not know 
# what to do here.
# This can be easily fixed by anticipating the possibility of NA values and 
# testing to see if the input is a NA:

printsign1 <- function(x){
  if(is.na(x)){
    print("x is a missing value!")
  }
  else if(x > 0)
    print("x is greater than zero")
   else
    print("x is less than or equal to zero")
}
printsign1(NA)

# This function now works as intended.

# Let’s look at another situation concerning vectors:
printsign1(2:4)

# Why are we geing this error? - we have into printsign1() a vector x of
# length 2 rather than a scalar of length 1.

# ● Inside the body of printsign1(), the expression is.na(x) returns a vector 
# that is tested in the if statement. However, the if condition cannot take 
# vector arguments so you get an error.

# ● The key issue is that printsign1() is not vectorized.

# ● This can be solved by simply not allowing vector arguments or vectorize the 
# printsign1() function to take vector arguments.

## non-vector arguments
# First, we check the length of the input in the function:
printsign2 <- function(x){
  if(length(x) > 1)
    stop("'x' has length > 1")
  if(is.na(x)){
    print("x is a missing value!")
  }
  else if(x>0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
}
printsign2(2:4)

# When we pass a vector as arguments into printsign2(), we get an error.

## Vectorizing the function
# Vectorizing the function can be done easily with the Vectorize() function:
printsign3 <- Vectorize(printsign1)
x <- -1:1
printsign3(x)
a <- printsign3(x)

# The correct messages are now printed without any issues.

# ● Note that the return value of printsign3() is stored in a separate R object 
# as the use of Vectorize() does not preserves the invisibility of the 
# return value.

## Debugging Tools
# A. Traceback(): prints out the function call stack after an error occurs; 
# does nothing if there’s no error.
# B. debug(): flags a function for “debug” mode which allows you to step 
# through execution of a function one line at a time.
# C. browser(): suspends the execution of a function when it is called and puts 
# the function in debug mode.
# D. trace(): allows you to insert debugging code into a function at specific 
# places.
# E. recover(): allows you to modify the error behavior so that you can browse 
# the function call stack.

# Using traceback()
rev(X)
traceback()
glm(y ~ x, family = poisson)
traceback()

# Above shows that the error did not get thrown until the 7th level of the 
# function call stack, in which case the eval() function tried to evaluate the
# formula y ~ x and realized the object y did not exist.

# ● In all, the traceback is useful for figuring out the function an error 
# occurred but not useful for more detailed debugging.

# The debug() function initiates an interactive debugger 
# (also known as the “browser”) for a function in R.

# ● With the debugger, one can go through an R function one expression at a time 
# to deduce exactly where an error occurred.
 
# ● The debug() function takes a function as its argument. An example of 
# debugging the glm() function.

debug(glm) ## Flags glm() for interactive debugging
glm(y ~ x, family = poisson)

# Every time one calls the glm() function, it will launch the interactive 
# debugger. To turn this o, one needs to call the undebug() function.

# ● The debugger calls the browser at the very top level of the function body. 
#From there one can step through each expression in the body.

# ● There are a few special commands one can call in the browser:
# A. n executes the current expression and moves to the next expression.
# B. c continues execution of the function and does not stop until either an 
# error or the function exits.
# C. Q quits the browser.

# While in the browser, one can execute any other R functions that might be 
# available in the regular session.
# ● One can use ls() to see what is in the current (function) environment and 
# print() to print out the values of R objects in the environment.
# ● The interactive debugging can be turned o using the undebug() function:
undebug(glm)

## Using recover()
options(error = recover)
glm(y ~ x, famiily = poisson)

# The recover() prints out the function call stack when an error occurs.

# ● You can then jump around the call stack and investigate the problem.

# ● When a frame number is chosen, one will be put in the browser
# (similar to the interactive debugger triggered with debug()) and will have 
# the ability to poke around.

## Profiling R Code
# Profiling is a systematic way to examine how much time is spent in dierent
# parts of a program.

# Profiling - system.time()
# The elapsed time may be smaller than the user time if your machine has 
# multiple cores/processors and can use them.
x <- runif (100000000) > system.time(as.numeric(readling(prompt = 
                                                           "Enter a number: ")))
system.time(min(x))

# Longer expressions can be timed by wrapping in curly braces {} within the
# system.time():

system.time({
  x <- runif(100000000, 0, 1)
  min_val <- x[1]
  for (i in 2:100000000){
    if (x[i] > min_val) {
      min_val <- x[i]
    }
  }
})

# If the expression is too long, you won’t be able to identify which part of 
# the code is causing the boleneck.

##The R Profiler
# The profiler is started by calling the Rprof() function.

Rprof() ## Turn on the profiler

# ● It takes no arguments to turn on and writes its output to a file
# called Rprof.out (the name of the output file can also be given).

# ● Once the Rprof() function is called, everything that is done from then on 
# will be measured by the profiler.

# ● It is advisable to run only a single expression once the profiler is turned
# on and then immediately turn it o - To avoid mixing too many expressions and 
# inability to sort out bolenecks.

#● The profiler can be turned o by passing NULL to Rprof().

Rprof(NULL) ## Turn off the profiler

# Let’s look at an example by calling glm() on some uniformly distributed data 
# x and y:

x <- runif(100000000, 0, 10)
y <- x + runif(100000000, 0, 1)
Rprof() ## Turn on the profiler
glm(y~x)
Rprof(NULL) ## Turn off the profiler

# The raw output from the profiler can be accessed from the Rprof.out data.
# At each line of the output, the profiler writes out the function call stack. 
# Further, the summaryRprof() is needed to interpret this data.

## Using summaryRprof()

# The summaryRprof() function tabulates the R profiler output and calculates 
# how much time is spent in which function. There are two methods for 
# normalizing the data:
# A. “by.total” divides the time spend in each function by the total run time

$by.total

# "by.self” does the same as “by.total” but first subtracts out time spent 
# in functions above the current function in the call stack - this output 
# is much more useful.

summaryRprof()

# We can see that majority 35.29% of the time is spent in glm.fit()
# The final bit of output that summaryRprof() provides is the sampling 
# interval and the total runtime.

## Microbenchmark package
# The microbenchmark package is useful for running small sections of code to 
# assess performance, as well as for comparing the speed of several functions 
# that do the same thing.
# ● The microbenchmark() function in this package will run code multiple times 
# (100 is the default) and provide summary statistics describing how long the 
# code took to run across those iterations.
library("microbenchmark")
microbenchmark(a <- rnorm(10000),
               b <- runiff(10000,0,10))

#This output gives summary statistics describing the time it took to run the 
# two function over the 100 iterations of each function call. These are given 
# in a reasonable unit.

# The microbenchmark function is mostly useful for comparing functions that take
# the same inputs and return the same outputs.

# ● As an example, we need a function that that find the minimum number in a 
# vector. Below are two functions that can perform these actions:

min_x <- function(x){
  min_val <- x[1]
  for (i in 2: length((x)){
    if (x[i] > min_val){
      min_val <- x[i]
    }
  })
min_x1 <- finciton (x){
  min(x)
}
  
# This uses the standard base R min() function, which is vectorised.
#  The performance of these two functions can be compared using microbenchmark:
  
  minfunc_perf <- microbenchmark (min_x(sample(100000, 10000)),
                              min_x1s(sample(100000, 10000 )))
  minfunc_perf
  
  # It is clear to see that the min_x1() functions performs beer as expected
  # as ploed below.
  
library("ggplot2")
autoplot(minfunc_perf)  

## Find Week 11 on Week 11.R script.