# WEEK 12: Course Review, R markdown and Project
## Tue 23 July 2024

## See You Next Semester

installed.packages()
library()

## R Markdown file
# open demoMarkdown.Rmd file for markdownfile

## Knitting the R Markdown File
# ● Call the function in the console:
#   render("document_name.Rmd", output_format = "html_document") or
# alternatively, the .rmd file can be converted by clicking on the drop down
# arrow next to the knit buon, select the document format 
# (HTML, PDF, Word) and the report is then displayed on the viewer tab.


## Components of an R Markdown File
# ● These lines will generate a generic heading at the top of the final report. 
# Several YAML options can be used to enhance reports:
#   A. hyperlinks can be used around the title or author name. B. 
# The current date can be coded so that anytime the
# report is run the current date will print o.
# C. The date, author or title can be excluded by using NULL
# or delete the line.
# D. The report does not include a table of contents (TOC)
# by default.
# E. Beneficial to always keep a copy of the markdown file
# after rendering.


## Components of an R Markdown File
# Code Chunks:
#   ● R code chunks can be used to render R output into documents or 
# display code for illustration.
# ● Code chunks start with: ```{r chunk_name} and end with ```. 
# They are easily inserted into R Markdown with the shortcut Ctrl + Alt + I.
# ● Naming a chunk is optional, but recommended. Each chunk name must be unique,
# and only contain alphanumeric characters and _:

## Components of an R Markdown File
# ● Let’s load the tidyverse package and Titanic.csv file, we will 
# insert a chunk at the start and call it ‘setup’. Since we don’t want this code 
# or its output to show in the HTML document, we add an 
# include = FALSE option after the chunk name ({r setup, include = FALSE}).

## Customising chunk output
# ● We can use include = FALSE in a code chunk to prevent the code and output 
# from printing in the knied document. There are additional options available 
# to customise how the code-chunks are presented. The options are entered in 
# the code chunk after the chunk_name and separated by commas {r chunk_name, 
# eval = FALSE, echo = TRUE, include = FALSE}:

## The default seings for chunk options are all TRUE. 
# The default seings can be set for all chunak in the document 
# by entering: knitr::opts_chunk$set(echo = TRUE) -
#   this will change the default value of echo to TRUE for every code.

## MID-LESSON QUESTIONS
# What happens if you use eval = FALSE and echo = FALSE? 
#   What is the dierence between this and include = FALSE?
#   Create a chunk with {r eval = FALSE, echo = FALSE},

# eval = FALSE and echo = FALSE will neither run the code in the chunk, 
# nor show the code in the knied document. The code chunk essentially doesn’t 
# exist in the knied document as it was never run. 
# Whereas include = FALSE will run the code and store the output for later use.

## IN-LINE R CODE
# ● Let look at some in-line R code in presenting descriptive statistics.
# ● We use a similar method as used for code chunk, the only dierence
# is the number of backticks.
# ● In-line R code uses one backtick (`r`),
# whereas code chunks use three backticks (``` r ```).
# ● For example, today’s date is `r Sys.Date()`, will be knied as: 
#   today’s date is 24-09-2023. Technically, the code will display the date 
# the document was last knied.
# ● The best way to use in-line R code, is to minimise the amount of 
# code you need to produce the in-line output by preparing the output in
# code chunks previously.