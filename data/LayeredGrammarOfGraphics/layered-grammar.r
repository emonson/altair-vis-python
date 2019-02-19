library(ggplot2)

# Examples of legends from four different scales.  From left to right:
# continuous variable mapped to size and colour, discrete variable
# mapped to shape and colour.  The legend automatically responds to the
# the geoms used in the plot, from left to right: points, tiles,
# points, points \& lines.
df <- data.frame(a = letters[1:5], b = seq(2, 10, 2))
p <- qplot(1:5, 1:5, data=df) + opts(keep = "legend_box")
p + aes(size = b) + scale_size("")
p + aes(fill = b) + geom_tile() + 
  scale_fill_gradient("", low="red", high="blue")
p + aes(shape = a) + scale_shape("")
p + aes(colour = a) + geom_line() + scale_colour_hue("")

# Examples of axes and grid lines for three coordinate systems:
# Cartesian, semi-log and polar. The polar coordinate system
# illustrates the difficulties associated with non-Cartesian
# coordinates: it is hard to draw the axes well.
x1 <- c(1,10)
y1 <- c(1, 5)
p <- qplot(x1, y1, geom="blank", xlab=NULL, ylab=NULL) + theme_bw()
p 
p + coord_trans(y="log10")
p + coord_polar()

# (Left) Scatterplot of price vs carat. (Right) scatterplot of price vs
# carat, with log-transformed scales, and a linear smooth layered on
# top.
dsmall <- diamonds[sample(nrow(diamonds),1000), ]
qplot(carat, price, data = dsmall)
qplot(carat, price, data = dsmall, log="xy") + 
 geom_smooth(method = lm)

# Two histograms of diamond price produced by the histogram geom.
# (Left) Default bin width, 30 bins. (Right) Custom \$50 bin width
# reveals missing data.
qplot(price, data=diamonds, geom="histogram")
qplot(price, data=diamonds, geom="histogram", binwidth=50)

# Variations on the histogram.  Using a ribbon (left) to produce a
# frequency polygon, or points (right) to produce an unnamed graphic.
qplot(price, data=diamonds, stat="bin", geom="point", binwidth = 1000)
qplot(price, data=diamonds, stat="bin", geom="area", binwidth = 1000)

# Pie chart (left) and bullseye chart (right) showing the distribution
# of diamonds across clarity ({\sc i1} is worst, {\sc if} is best).  A
# bullseye chart is the polar equivalent of the spineplot: in the pie
# chart, categories have equal radius and variable angle; in the radial
# chart, categories have equal angle and variable radius.
bars <-  qplot(clarity, data=diamonds, geom="blank", fill=clarity) +
   scale_fill_brewer(palette="YlGnBu")
stack <- bars + aes(x = factor(1)) + scale_x_discrete(labels = "")

stack + geom_bar(width = 1) + coord_polar(theta="y")
stack + geom_bar(width = 1) + coord_polar()

# Bar chart (left) and equivalent Coxcomb plot (right) of clarity
# distribution.  The Coxcomb plot is a bar chart in polar coordinates.
# Note that the categories abut in the Coxcomb, but are separated in
# the bar chart: this is an example of a graphical convention that
# differs in different coordinate systems.
bars + geom_bar()
bars + geom_bar(width = 1) + coord_polar()

# Transforming the data (left) vs transforming the scale (right).  From
# a distance the plots look identical.  Close inspection is required to
# see that the scales and minor grid lines are different.  Transforming
# the scale is to be preferred as the axes are labelled according to
# the original data, and so are easier to interpret.  The presentation
# of the labels still requires work.
lmfit <- layer(geom = "smooth", method = "lm", se = FALSE)
qplot(log10(carat), log10(price), data = dsmall) + lmfit
qplot(carat, price, data = dsmall, log="xy") + lmfit

# Transforming the scales (left) vs transforming the coordinate system
# (right). Coordinate system transformations are the final step in
# drawing the graphic, and affect the shape of geometric objects.  Here
# a straight line becomes a curve, and demonstrates why fitting a
# linear model to the untranformed data is such a bad idea.
qplot(carat, price, data = dsmall, log = "xy") + lmfit
qplot(carat, price, data = dsmall) + lmfit + 
  coord_trans(x = "log10", y = "log10") + ylim(1, 18692)

# Linear model fit to raw data (left) vs linear model fit to logged
# data, then back-transformed to original scale (right).
qplot(carat, price, data = dsmall) + lmfit
qplot(carat, price, data = dsmall, log="xy") + lmfit + 
  coord_trans(x = "pow10", y = "pow10")
