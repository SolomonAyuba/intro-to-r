# WEEK 9: Data Visualization with R				    
## Sun 14 July 2024

## Basic Plots - Scatter plots
# We will look at creating and customizing plots using Base R and 
# ggplot2 packages.

# This is intended to give an overview of the most basic features of plotting
# – axes, titles, and colour. R’s plot() function, which is the basis for many 
# plots would be explored in depth.

# Let us explore its basic use on a simple uniform random data:

x <- runif(1000,0,10)
y <- x + runif(1000,0,1)
plot(x,y)

# The variable wrien as the first argument is ploed on the x-axis, 
# and the second argument is ploed on the y-axis

## Basic Plots - Axes labels and titles
# It very well clear that the plot in the previous slide is dreary: there is 
# no title/caption, the axis labels take the variable name, and the observations 
# are ploed as black circles.

# Let us add a title and appropriate axis labels using the plot().

# We use main to specify the title,\n at the point to break the line and xlab
# and ylab to specify the x- and y-axis labels, respectively:

plot(x,y, main = "A plot of a uniform random variable",
     xlab = " Exploratory Variable x", ylab = "Response Variable y")

plot(x,y, main = "A plot of a uniform random variable \n x against y",
     xlab = " Exploratory Variable x", ylab = "Response Variable y")

## Plotting symbols and colours
# The default in R when producing a scaerplot is to use open circles, 
# which can be changed easily using the pch (plot character) argument.

# Below shows the range of ploing symbols that can be used, with their 
# numeric codes from 0 through 25.
# Size of a ploing symbol can be changed using cex (default is 1).

plot(x,y, main ="Exploratory Variable x", ylab = "Response Variable y",
     pch = 19, cex = 0.5)
plot(x,y)

# A bit of colour can make a graph come alive and still very readable.

# To add colour, we use the col argument either with a recognisable
# or a hexadecimal RGB triplet (col = "#C69647").
# name (col = "red" )

# We can choose a dierent ploing symbol which has a separate border
# (numeric codes 21–25), then we can specify a colour for the inside of the 
# symbol (via bg - ‘background’) and the border (via the col argument).

plot(x,y, xlab = "Exploratory variable x", ylab ="Response variable y",
     pch = 19, cex = 0.5, col = "blue")
plot(x,y)

plot(x,y, xlab = "Exploratory variable x", ylab ="Response variable y",
     pch = 22, cex = 1, col = "red", bg="green")

# If we are to define a sequence of colours for a plot when several are needed,
# there are ready-made ‘palees’ available.

# hue_pal() function from the scales package is used to generate contrasting 
# depending on how many are needed in a plot.

# If four colours are needed in a plot:
library("scales")
hue_pal()(4)

# We can pick individual colours as needed using square brackets:
plot (x,y, xlab ="Exploratory variable x", ylab = "Response variable y",
      pch = "22", cex = 1, col = hue_pal()(4)[2], bg = hue_pal()(4)[4])

## Saving graphics
# For quality graphics, saving plots as PDF, PostScript or other file type
# is important.

# By default, plots show up in the Plots pane in the boom right-hand corner,
# which can be saved to any format.

# If a high-quality PDF, postscript, bmp, png or jpeg is needed, this is done 
# by specifying the ‘device’ before starting, then turning the device o 
# once finished.

pdf("myplot.pdf", width = 7, height =4)
plot(x,y, xlab = "Exploratory variable x", ylab = " Response variable y",
     pch = 22, cex = 1, col = hue_pal()(4)[2], bg = hue_pal()(4)[4])
dev.off()

# The file is opened using the pdf() function, the intended file name is 
# specified, and the width and height are stated. Now close the file using 
# dev.off(). Other functions could be used: postscript() bmp(), png(), 
# jpeg(), and tiff().

## Histograms
# A histogram is used for continuous numeric variables, where the value of the 
# variable is on the x-axis and the y-axis shows the probability density 
# or frequency.

# The x-axis is cut into ‘bins’ which follow a prescribed order. They are 
# connected bars which represent the continuous variable.

# Let’s ask R for a histogram using the hist() function, colour it using the 
# col argument, and specify its title via main argument.
x <- seq(-10 ,20, by = .001)
y <- rnorm(x, mean = 5, sd = 1.0) # For Histogram
hist(y, main = " Histogram of y", col = "orange")

# Exploring a normally distributed random variable with mean of 5 and 
# standard deviation of 1 between -10 and 20.

## Mid-lesson Questions
# Plot the histogram of the normally distributed data y using varying 
# bin widths of 0.5 & 1 and for the bin width of 1, change the y-axis from
# frequency to probability density.
# (the argument breaks is utilized to change bin widths)

hist(y, breaks = seq(-10, 20, by = 0.5), col ="orange", main ="")
hist(y, breaks = seq(-10, 20, by = 1), col ="orange", main ="")
hist(y, breaks = seq(-10, 20, by = 1), col ="orange", main ="", freq = FALSE)

## Density plots
# A density plot can be a useful alternative to a histogram when you want to 
# see the shape of a distribution of a variable.

#The relevant function is density() which estimates the density, and from 
# there we can use plot() to get an outline of the density.

# The body of the line can also be coloured using the polygon() function.
plot(density(y), col = "orange", main="")
polygon(density(y), col ="orange", main="")

# It’s possible to use the density() function to superimpose the estimated 
# density on a histogram as below:

hist(y, breaks = seq(-10, 20, by = 0.5), col = "orange", main = "", 
     freq = FALSE)
lines(density(y))

## Bar charts
# A bar chart is used for categorical data, where we have the categories on
# the x-axis and height of the bars (frequency) on the y-axis.

# These bars are not connected as the categories are distinct and we can in
# general reorder the bars however we like.
 
# Bar charts are simple to demonstrate, but first we need to create a table
# and then pass on this table to the barplot() function.

tally <- rnbinom (100, mu = 1, size = 2)
table_tally <- table(tally)
barplot (table_tally, col = hue_pal()(6), ylab = "Frequency")
# Exploring 100 negative binomially distributed random variable with mean 
# of 1 and size of 2.

## Box plots
# Boxplots are great for showcasing continuous data when it’s in abundance. 
# It is a graphical representation of the ‘five number summary’: minimum, 
# 25th percentile, median (50th percentile), 75th percentile, and maximum.

# This allows us to get a good feel for the ‘shape’ of the distribution of the 
# underlying variable.

# The box represents the middle 50% of the data (from the 25th percentile at
# the lower end to the 75th percentile at the upper end), with the heavy 
# horizontal line in the box representing the median.

#The endpoints of the ‘whiskers’ usually show the minimum and maximum values 
# (‘box-and-whisker’ plot shortened to ‘boxplot’).

# Let’s summarize the normally distributed data y and make a vertical 
# and horizontal box plot.

summary(y)
boxplot(y, col = "orange")
boxplot(y, col ="orange", horizontal = TRUE)

## Basic Plotting with ggplot2
library("ggplot2")
# We have seen how to make plots using the plot() function but we can already 
# notice some limitations of the Base R plot() function : line plots, legends, 
# multiple plots or multi-panel ploing.

# Now, we will learn about the general ggplot ploing functions from ggplot2 
# package and how to use them to modify plots.

# ggplot() is a very powerful tool which uses the grammar of graphics which 
# works only with data frame. When creating a plot using ggplot(), the two
# essential elements one must specify: aesthetics and geoms.
# 
# Aesthetics are mappings between the variables in the data and visual
# properties of the plots. They are set in the aes() function and the common
# ones are:
# A. x, y , color/colour, size
# B. fill, shape, linetype, group
# 
# If you set these in aes, then you set them to a variable. If you want to 
# set them for all values, set them in a geom

# Geom is layer which determines how the data will be ploed:
#  geom_point - add points; geom_line - add lines
#  geom_density - add density plot; geom_histogram - add histogram
#  geom_smooth - add a smoother; geom_boxplot - add a boxplot
#  geom_bar - add a bar chart; geom_tile - rectangles/heatmaps

#  You add these layer with + sign. If you assign a plot to an object, 
# you must call print() to display it.

#  We will use a worldwide mortality data from 1760 to 2010 and read it 
# as a tibble:

# Let’s look at the mortality rate of Nigeria since 1900 in a scaer plot.
# Scatter plot

## Enable/install the 'dplyr' & 'readr' package to use the read_csv() function
library("dplyr")
library("readr")
mort_rate <- read_csv("mortalitydata2.csv")

# Let’s look at the mortality rate of Nigeria since 1900 in a scaer plot.
Nigeria_mort <- mort_rate |> filter(country == "Nigeria" & year >= 1900)

Nig_g <- ggplot(Nigeria_mort, aes(x = year, y = morts))
Nig_g

Nig_g + geom_point()
Nig_g + geom_point() + geom_line()

# This does nothing as we do not have a geom layer. We can add points,lines 
# or both.

# We can change the data in the plot,by making a new call to ggplot.

# Let’s look at the mortality rates since 1900 using line plots for each of
# the countries: Nigeria, South Africa, Egypt , Kenya.

# To get a line for each country individually, we need to specify the group 
# aesthetic and map it to the country variable.

Africa_morts <- mort_rate |> filter(country %in% c("Nigeria", "South Africa", 
                                                    "Egypt", "Kenya") & year
                                     >= 1900)
Africa_g <- ggplot(Africa_morts, aes(x = year, y = morts, group = country))
Africa_g + geom_line()

# Unfortunately, we cannot tell which country corresponds to which line.

## Box plot & Histogram
# We could show the boxplots of the mortality rates for each country.
# Let’s look at the mortality rates between 2000 to 2002 using a histogram.
year_rate <- mort_rate |> filter(year %in% c(2000, 2001, 2002))
year_g <- ggplot(year_rate, aes(x = morts))
year_g <- geom_histogram(bins = 50, fill = "dark gray")
Africa_g + geom_boxplot()

## Axes and Titles
# We can add to a plot descriptive axis labels and a title. We can do this 
# using labs function.
# 
# The x and y axis limits can be adjusted using the xlim() and ylim() 
#  functions to change the view of the ploing regions.

Africa_gg <- Africa_g + geom_line() +
  labs(x = "Year", y = "Mortality Rate", title = "Chid Mortality Rates",
       subtitle = "Nigeria, South Africa, Egypt & Kenya")  
Africa_gg
Africa_gg + xlim(c(1900, 2010)) + ylim(c(0,4))

# Axes and Titles
# To change the position and appearance of the text appearing in the titles or
# axes, we can use the theme() function.

# theme() controls the look and feel of the plot. The arguments passed to theme
# components are required to be set using special functions:
# A. element_text(): to set text aributes - labels and titles.
# B. element_line(): to modify line components - axis lines, major & minor grid
# lines.

# C. element_rect(): to modify rectangle components - plot and panel background.
# D. element_blank(): turns o the displaying theme.
 
# Next, we would use the element_text() function, inside we can set:
# A. size - adjusts size of the text; face - font face (“plain”, “italic”, 
# “bold”, “bold.italic”)
# B. family - font family; color - font color
# C. hjust/vjust - horizontal/vertical justification (a number
#                                                     between 0 and 1)
# D. line height - similar to size for text; angle - text rotation angle.

Africa_gg + theme(plot.title = element_text(size = 15,
                                            face = "bold",
                                            family = "Arial",
                                            color = "red",
                                            hjust = 0.5,
                                            lineheight = 1.2), #title
                  plot.subtitle = element_text(size = 10,
                                               family = "Arial",
                                               face = "bold",
                                               hjust = 0.5), #subtitle
                  axis.title.x = element_text(size = 10), #X axis title
                  axis.title.y = element_text(size = 10), #Y axis title
                  axis.text.x = element_text(size = 10, 
                                             angle = 30,
                                             vjust = .5), # x axis text
                  axis.text.y = element_text(size = 10)) #y axis text

## Plotting characters
# To set the ploing character or symbol for a point, we use the shape aesthetic
# in geom_point(). R has 26 ploing characters numbered from 0 to 25.

# For dierent characters, we distinguish between groups using shape inside of
# aes in geom_point().

Nig_g <- ggplot(Nigeria_mort, aes(x = year, y = morts))
Nig_g + geom_point(shape = 2)
Africa_g <- ggplot(Africa_morts, aes(x = year, y = morts, group = country))
Africa_g + geom_point(aes(shape = country))

# ggplot automatically chooses a set of characters and makes a legend.

## Mid-lesson Questions - Plotting line types
# Replicate the geom_line() plot using dierent line types for the single 
# (Nigeria) and group (Africa) plots - hint: use linetype as aesthetic.

Nig_g + geom_line(linetype = 2)
Africa_g + geom_line(aes(linetype = country))

## Plotting colors
# We can also modify the colors used in the plots by using the color aesthetic
# or the fill aesthetic depending on the plot type.

# Similar to ploing characters and linetypes, we can let ggplot choose this 
# automatically or by set them manually.

Nig_g + geom_line(color = "red") + geom_point(color = "blue")
Africa_g + geom_point(aes(color = country)) + geom_line(aes(color = country))

# Modifying a legend

# To modify the labels and title text in a legend, use the scale_color_brewer() 
# function that can be used to define the groups in the legend with the name
# argument for the legend title and labels for the group labels.

# You can also disable a legend from appearing using the option guide = FALSE.

Africa_g + geom_line(aes(color = country)) +
  scale_color_brewer(type = "seq", palette = "Dark2", name = "Country",
                     labels = paste("Country", LETTERS[1:4]))
Africa_g + geom_line(aes(color = country)) + 
  scale_color_brewer(type = "seq", palette = "Dark 2", name = "Country",
                     labels= paste("Country", LETTERS[1:4]), guide = FALSE)

# The theme() can also be used to modify legends

Africa_g + geom_line(aes(color = country)) +
  scale_color_brewer(type = "seq", palette = "Dark2", name = "Country")
  theme(legend.position = "bottom")
  
Africa_g + geom_line(aes(color = country)) +
  scale_color_brewer(type = "seq", palette = "Dark2", name = "Country")
  theme(legend.position = c(0.85, 0.75),
        legend.background = element_rect(fill = "transparent"),
        legend.key = element_rect(fill = "transparent"),
        legend.title = element_text(size = 12, face = "bold"),
        legend.text = element_text(size = 8, face ="italic"))
  

# Adding Text and Labels
  # We can add labels to points using the geom_text() layer.
  # Using scaer plot, let’s label the countries using the mortality rate for
  # the years 2000 to 2004. We will use only countries starting with D:
  D_rate <-  mort_rate[grep("^D", mort_rate$country),]
  D_mort_rate <- D_rate |>filter(year %in% 2000:2004)
  Countries_D_g <- ggplot(D_mort_rate, aes(x = year, y = morts, 
                                           group = country))
  Countries_D_g + geom_point(aes(color = country)) + geom_text (aes(label = 
                                                                      country), 
                                                                nudge_y = 0.05)
  
  # Multiple Plots in a Single Figure
  # If we want to break a dense plot into individual plots, we use faceing.
  
  # If we want to separate the four scaerplots with plot lines for the 
  # mortality data subset Africa_morts, we use facet_wrap to break them into 
  # separate plots instead of one that are ploed in a single pane/figure.
  
  Africa_g <- ggplot(Africa_morts, aes(x = year, y = morts, group = country))
  Africa_g + geom_point(aes(color = country)) + geom_line(aes(color = 
                                                                country)) +
  facet_wrap(~ country) + scale_color_discrete(guide = FALSE)
  
  ## Multiple Plots in a Single Figure
   # We can adjust the layout and number of rows and columns by using nrow and 
  # ncol in facet_wrap:
  Africa_g <- ggplot(Africa_morts, aes(x = year, y = morts, group = country))
  Africa_g + geom_point(aes(color = country)) + geom_line(aes(color = 
                                                                country)) +
    facet_wrap(~ country, nrow = 1) + scale_color_discrete(guide = FALSE)
  
  ## Saving Plots
  # ggplot2 provides ggsave to save plots in a number of formats, such as .png 
  # or .pdf. This function saves the last plot that you displayed.
  
  mortalityplot <- Africa_g + geom_point(aes(color = country)) + 
    geom_line(aes(color = country)) + facet_wrap(~ country) +
    scale_color_discrete(guide = FALSE)
  
  print(mortalityplot)
  ggsave("mortalityplot.pdf", width = 4, height = 4)  
  
  ## Find Week 10 on Week 10.R script.	      