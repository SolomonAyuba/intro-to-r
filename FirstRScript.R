c## WEEK 1 - Introduction to R Programming


#list packages that are currently attached to the system
search()

#view all the available packages on the system use the function
#library()

#to attach a package to the system, use the  function
#library(packagename) or select the package in the menu

# put ? before a function to get help e.g
?sum
# if the function name is not known, but general area is, use help.search() .e.g
help.search("data")
#other useful functions are find() and apropos()

#Basic operations | Arithmetic
3 + 6
4 + 4 * 2 / 4 -
 6 - 8 + 5 * 3 
# when continuation is expected, the prompt changes from > to +. 
# The + continuation prompt does not carry out the arithmetic plus operation
# Cancel the + continuation prompt by pressing Esc key

#two or more expressions can be placed on a single line - separated by semicolons;
2 + 3; 5 * 7; 3 - 7

#Modular Arithmetic | BODMAS order of carrying out arithmetic operations
5 + 3 - 3 * 6; 7^3 / 4

#value for pi is known as pi
pi

#to obtain the integer and remainder of a division
122 %/% 7; 122 %% 7

#modulo is used to determine if a number is an exact multiple of some other number

#Rounding numbers
# Round() function can be used to round to any number of decimal places
round(4.6382, 3); round(4.6382, 0)
# The companion functions ceiling() and floor() too
ceiling(4.6382); floor(4.6382)

#use ?round help to find other functions
?round

#Complex Numbers
2.3 - 7i

#The Real and Imaginary Parts are obtained using
Re(2.3 -7i); Im(2.3 - 7i)
#To know whether a number is complex or turn a real number into a complex one
is.complex(2.3 - 7i); as.complex(2.3)
# other complex functions are: Mod(), Arg(), Conj()

#Integers
#The as.integers() function is used to convert numeric to integers
#it removes the decimal part when applied to real numbers and 
as.integer(4.8); as.integer(-6.8)
#removes the imaginary part when applied to complex numbers
as.integer(6.3 - 3i)

#Basic Operators
#R has a form of scientific notation called exponents
3^2; 3e2; 3e-2


#Generating Sequence
# use : to create a sequence of integers colon
1:8; 8:1; 
#for sequence in steps other than 1, the seq() function is used
#it has 3 arguements: from = ..., to =..., by =...
# (the initial value, the final value and the increment)
seq(from = 0, to = 20, by = 2); seq(20,0,-2) #simpler method

#rep() function is used to generate a repeat of value - ?rep
rep(6,4) #repeats 6 by 4 times.
rep(1:5, 3) #repeats 1 through to 5 in 3 places

#Sampling
#the sample() function shuffles the contents of a vector into a random sequence
1:8; sample(1:8)
sample(1:8) #the order of the value is different each time sample() is invoked
#we can specify the size of the sample as a second argument
#suppose we want five random elements from 1:20
sample(1:20, 5)

#R as a Calculator: 

#Logical Operators
3 > 6; 3 == 6; 3 <= 6

#testing for equality of real numbers the all.equal() function is used
x <- 0.4 - 0.2; y <- 0.2; x == y
all.equal(x,y)

# the argument tolerance =... can be set at a level to compare the two numbers
all.equal (pi, 3.141, tolerance = 0.001)

#Logical Arithmetic
#Due to coercion in R: Logical TRUE has been coerced to numeric 1 and
#Logical FALSE has been coerced to numeric 0.

x2 <- 1:8; x2
#different question can be asked of the vector x2
x2 < 3; x2 == 3

#logical functions like all() and any() - check an entire vector to return a single logical value TRUE or FALSE
all(x2 > 0) #are all the values in x2 larger than 0 ?
any(x2 < 0) #are any values in x2 negative



# Assigning value to variable name (objects)
b <- 5
n <- 2
b; n

# display the list of object in a work space
ls()

# remove a specific object
rm(b)

# to remove all object in this work space: 
# rm(list=ls()) #I intentionally made this inactive for obvious reasons, lol

# to check the data type of an object
class(n)
 

## Find Week 2 on Week 2.R script.
