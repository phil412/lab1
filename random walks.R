<<<<<<< HEAD
################# random walks lab ###############################
## Reed College, Phil 412: Computation, Mark Bedau, 7 Sept 2009 ##
##################################################################

##################################
# produce white noise by sampling
sample.int(10, 10, replace=T)
sample.int(100, 100, replace=T)

## QQ - 	Can you explain how sample.int() works?
## QQQ - 	Can you get sample.int() to create some pattern other than white noise?
## 			Can you get this to produce some pattern
##				Try: plot(sample(10000,5), type="l")
##				Is this just a "pseudo" pattern (not robust, mere accident)?

##################################
# simple plotting
1:10
plot(1:10)
plot(1:10, type="l")
=======
################# random walk stuff #################
#
# randu(base) Random Numbers from Congruential Generator
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6

##################################
# plot white noise, histogram it
plot(sample.int(100, 1000, replace=T))
hist(sample.int(100,1000, replace=T))
<<<<<<< HEAD
hist(sample.int(100,1000, replace=T), breaks=100)

## QQ - Describe the general pattern that this command produces
## 		Make a figure that best illustrates the general pattern
=======
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6

plot.hist.sample <- function(n=1000, ...) {
	op <- par(mfrow=c(2,1))
	plot(sample.int(100, n, replace=T), ...)
	hist(sample.int(100, n, replace=T))
	par(op)
}
<<<<<<< HEAD
plot.hist.sample(100)

## DQ - Repeat this command: plot.hist.sample(10)
## DQ - Do you see a pattern? Look closely!

## QQ - Largest sample that regularly produces extremely skewed histograms?
## QQ - 	Compare, describe and explain differences; 
##				plot.hist.sample(1000)
##				plot.hist.sample(100)
##				plot.hist.sample(10)
##			Do you see robust patterns?
## 			Describe how easy it is to see "spurious" patterns in sparce data!
##			Find smallest sample needed to avoid most spurious patterns.


#####################################
# random walk of length n, using steps of +1 or -1
rwalk.binary <- function (n) {
	rw <- sample(c(-1,1), n, replace=T)
	for (i in 2:n) { rw[i] <- rw[i-1]+rw[i] }
	rw
}

plot(rwalk.binary(10))
plot(rwalk.binary(100))
plot(rwalk.binary(1000))
plot(rwalk.binary(10000))		## QQ - Detect time lag on computer?
plot(rwalk.binary(100000))		## QQ - Notice definite time lag!


####################################
# average of 5 random walks  -- TO DO: revise with loop over n random walks

avg5walks <- function(l=100) {
	x1 <- rwalk.binary(l)
	x2 <- rwalk.binary(l)
	x3 <- rwalk.binary(l)
	x4 <- rwalk.binary(l)
	x5 <- rwalk.binary(l)
	for (i in 2:l) { x1[i] <- x1[i-1]+x1[i] }
	for (i in 2:l) { x2[i] <- x2[i-1]+x2[i] }
	for (i in 2:l) { x3[i] <- x3[i-1]+x3[i] }
	for (i in 2:l) { x4[i] <- x4[i-1]+x4[i] }
	for (i in 2:l) { x5[i] <- x5[i-1]+x5[i] }
	xmax <- max(x1, x2, x3, x4, x5)
	xmin <- min(x1, x2, x3, x4, x5)
	y <- (x1 + x2 + x3 + x4 + x5) / 5
	plot(y, type="l", col="red", ylim=range(c(xmin, xmax)))
	lines(x1)
	lines(x2)
	lines(x3)
	lines(x4)
	lines(x5)
}


## QQ - Run the commands below, and explain what you see. 
## 		When are there lots of "false" patterns?
##		When does R performance hit the wall?

avg5walks(10)
avg5walks(100)
avg5walks(1000)
avg5walks(10000)
avg5walks(100000)


# plot set of random walks ... plotting as you go
# 	n = number of random walks
# 	l = length of random walk
plot.nlwalks <- function(n,l) {
	plot (x <- rnorm(l), type="n", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	for (i in 1:n) lines (x <- rwalk(l))
	## lines(sqrt(1:l), col="red")		## ignore this line for now ...
}

plot.nlwalks(10, 100)
plot.nlwalks(10, 1000)
plot.nlwalks(100, 100)
plot.nlwalks(1000, 100)
plot.nlwalks(1000, 1000)		## QQ - Is there a curve to the outline of the shadow?
plot.nlwalks(100, 10000)		## QQ - Do you still see the curve?
								## !! - Plot the sq root of length in red

########################################################################################

Troubleshooting, in the terminal window:
	plot.nlwalks(1000,10000) 
	>>> this creates the spinning disk of death!
	QQ - an example of exponential transient? unfeasibility?

########################################################################################
########################################################################################
########################################################################################
########################################################################################

####################################
=======

#####################################
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
# plot gaussian noise, histogram it
plot(rnorm(1000))
hist(rnorm(1000))

plot.hist.gaussian <- function(n=1000, ...) {
	op <- par(mfrow=c(2,1))
	plot(rnorm(n), ...)
	hist(rnorm(n))
	par(op)
}

<<<<<<< HEAD

########### optional, playing around ###########
=======
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
# plot gaussian noise, with increasing standard deviation
plot(rnorm(100, sd=(1:100)), type="l")

# ... with increasing and then decreasing standard deviation
plot(rnorm(200, sd=c((1:100),(100:1))), type="l")

<<<<<<< HEAD
## QQ - Run this command: plot(rnorm(1000, sd=(1:100)), type="l")
## 		Describe any robust generic patterns that you observe.
##		Explain those patterns.
##		Now run this command: plot(rnorm(1000), type="l")
##		Compare the generic patterns this produces, vs. the earlier command

=======
#####################################
# random walk of length n, using steps of +1 or -1

rwalk.binary <- function (n) {
	rw <- sample(c(-1,1), n, replace=T)
	for (i in 2:n) { rw[i] <- rw[i-1]+rw[i] }
	rw
}
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6


#####################################
# create random walk of length n, using rnorm()
# To Do	start walk at 0
rwalk <- function (n) {
	rw <- rnorm(n)
	for (i in 2:n) { rw[i] <- rw[i-1]+rw[i] }
	rw
}

#  plot random walk of length n
plot.rwalk <- function(n=1000, ...) {
	rw <- rwalk(n)
	plot(rw, ...)
}

# plot histogram of randomwalk
hist(rwalk(1000))

plot.hist.rwalk <- function(n=1000, ...) {
	op <- par(mfrow=c(2,1))
	plot.rwalk(n, ...)
	hist(rwalk(n))
	par(op)
}


####################################
# average of 5 random walks  -- TO DO: revise with loop over n random walks

<<<<<<< HEAD
avg5walks.rnorm <- function(l=100) {
	x1 <- rnorm(l)	# TO DO: make n vectors of length l with 
	x2 <- rnorm(l)	# martix(rnorm(n * l), nrow=l, ncol=n)
	x3 <- rnorm(l)
	x4 <- rnorm(l)
	x5 <- rnorm(l)
	for (i in 2:l) { x1[i] <- x1[i-1]+x1[i] }
	for (i in 2:l) { x2[i] <- x2[i-1]+x2[i] }
	for (i in 2:l) { x3[i] <- x3[i-1]+x3[i] }
	for (i in 2:l) { x4[i] <- x4[i-1]+x4[i] }
	for (i in 2:l) { x5[i] <- x5[i-1]+x5[i] }
	y <- (x1 + x2 + x3 + x4 + x5) / 5
	plot(y, type="l", col="red", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	lines(x1)
	lines(x2)
	lines(x3)
	lines(x4)
	lines(x5)
=======
avg5walks <- function(l=100) {
x1 <- rnorm(l)	# TO DO: make n vectors of length l with 
x2 <- rnorm(l)	# martix(rnorm(n * l), nrow=l, ncol=n)
x3 <- rnorm(l)
x4 <- rnorm(l)
x5 <- rnorm(l)
for (i in 2:l) { x1[i] <- x1[i-1]+x1[i] }
for (i in 2:l) { x2[i] <- x2[i-1]+x2[i] }
for (i in 2:l) { x3[i] <- x3[i-1]+x3[i] }
for (i in 2:l) { x4[i] <- x4[i-1]+x4[i] }
for (i in 2:l) { x5[i] <- x5[i-1]+x5[i] }
y <- (x1 + x2 + x3 + x4 + x5) / 5
plot(y, type="l", col="red", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
lines(x1)
lines(x2)
lines(x3)
lines(x4)
lines(x5)
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
}


# plot set of random walks ... plotting as you go
# 	n = number of random walks
# 	l = length of random walk
plot.nlwalks <- function(n,l) {
	plot (x <- rnorm(l), type="n", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	for (i in 1:n) lines (x <- rwalk(l))
}


<<<<<<< HEAD

# TO DO plot "branching tree" of random walks
# TO DO	plot dynamic histogram of set or tree of random walks
# TO DO 	same, but with reflecting boundary at 0
# TO DO	same, but with steps (-1, 0, 1)
# TO DO	random phylogeny program, with extinction etc. (like McShea)
# TO DO	random phylogeny w/ optional bias toward "complexity"
#	check McShea tests for passive trends




=======
>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
####################################
# biased random walk -- works okay
rwalk.biased1 <- function(n=1000, pright=0.5) {
	pleft = 1-pright
	rw <- rnorm(n)
	for (i in 2:n) {rw[i] <- 
		(rw[i-1]+sample(c(-1,1), 1, prob=(c(pleft,pright))))}
	rw
}

####################################
# biased random walk
rwalk.biased2 <- function(n=1000, bias=0) {
	rw <- rnorm(n)
	for (i in 2:n) {
		if ( sample( c(0,1), 1, prob=c(bias,1-bias) )) {
		 rw[i] <- (rw[i-1]+rw[i])}
		 else {rw[i] <- (rw[i-1]+abs(rw[i]))}
	}
	rw
}

# plot biased random walk
plot(rwalk.biased2(bias=0.2), type="l")
plot(rwalk.biased2(bias=0.2), type="l", ylim=c(-250,250))
plot(rwalk.biased2(bias=0.15), type="l", ylim=c(-150,150))

#############################################
# create POSITIVE random walk of length n
# BUG	start walk at 0
posrwalk <- function (n) {
	rw <- rnorm(n)
	rw[1] <- abs(rw[1])
	for (i in 2:n) { 
		if ((rw[i]+rw[i-1]) >0) 
			{rw[i] <- rw[i]+rw[i-1]}
		else 
			{rw[i] <- abs(rw[i])+rw[i-1]}
	}
	rw
}

#########################################

#########################################
#  plot POSITIVE random walk of length n
plot.posrwalk <- function(n=1000) {
	rw <- posrwalk(n)
	plot(rw, type="l")
}

# plot 12 random walks of length n
plot12rwalks <- function(n) {
	op <- par(mfrow=c(4, 3))
	for (i in 1:12) plot.rwalk(n)
	par(op)
}

############################################
# plot 12 POSITIVE random walks of length n
plot12posrwalks <- function(n=1000) {
	op <- par(mfrow=c(4, 3))
	for (i in 1:12) plot.posrwalk(n)
	par(op)
}

############################################
# plot 20 POSITIVE random walks of length n
plot20posrwalks <- function(n=1000) {
	op <- par(mfrow=c(5, 4))
	for (i in 1:20) plot.posrwalk(n)
	par(op)
}


# compare random walk with 2 smoothed walks  ... BUG at start of vector in 2nd smoothing
# rewrite using functions above
op <- par(mfrow=c(3, 1))
a <- 100
x <- rnorm(a)
for (i in 2:a) { x[i] <- x[i]+x[i-1] }
plot(x, type="l")
w <- 1  		# radius of smoothing window
xs <- x		# copy of data to be smoothed
for (i in 1+w:a-w) { xs[i] <- mean(c(x[i-w], x[i], x[i+w])) }	# needs w=1
plot(xs, type="l")
w <- 2  		# radius of smoothing window
for (i in 1+w:a-w) { xs[i] <- mean(c(x[i-w], x[i-1], x[i], x[i+1],x[i+w])) }	# needs w=2
plot(xs, type="l")
par(op)

###################################################################
# plot set of POSITIVE random walks ... plotting as you go
# 	n = number of random walks
# 	l = length of random walk
plot.posnlwalks <- function(n=20,l=1000) {
	plot (x <- rnorm(l), type="n", ylim=range(c(0, 3*sqrt(l))))
	for (i in 1:n) lines (x <- posrwalk(l))
}

# make matrix of random walks
nlwalks <- function (n,l) {
x <- rnorm(n*l)
m <- matrix(x, nrow=n, ncol=l)
for (i in 1:n) m[i,] <- rwalk(l)
m
}

# make matrix of POSITIVE random walks
posnlwalks <- function (n,l) {
x <- rnorm(n*l)
m <- matrix(x, nrow=n, ncol=l)
for (i in 1:n) m[i,] <- posrwalk(l)
m
}

# mean of n random walks of length l
mean.nlwalks <- function(n,l) {
	m <- nlwalks (n,l)
	for (i in 1:l) v[i] <- mean(m[,i])
	v
}

# plot set of random walks with mean in red
plot.nlwalks.mean <- function(n,l) {
	m <- nlwalks(n,l)				# the walks
	v <- m[1,]				# create v (not needed?)
	for (i in 1:l) v[i] <- mean(m[,i])		# mean of walks
	plot(m[1,], type="n", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	for (i in 1:n) lines (m[i,])
	lines(v, col="red")
}

# plot set of POSITIVE random walks with mean in red
################# random walk stuff #################
#
# HW - predict the behavior of random walk
# HW - identify random walks vs. driven trends
#
#
# randu(base) Random Numbers from Congruential Generator

# 100 Bernoulli trials
# sample(c(0,1), 100, replace = TRUE)

# create random walk of length n
# BUG	start walk at 0
# BUG	walk steps are chosen from normal distribution, not 
rwalk <- function (n) {
	rw <- rnorm(n)
	for (i in 2:n) { rw[i] <- rw[i]+rw[i-1] }
	rw
}

# create POSITIVE random walk of length n
# BUG	start walk at 0
posrwalk <- function (n) {
	rw <- rnorm(n)
	rw[1] <- abs(rw[1])
	for (i in 2:n) { 
		if ((rw[i]+rw[i-1]) >0) 	{rw[i] <- rw[i]+rw[i-1]}
		else 			{rw[i] <- abs(rw[i])+rw[i-1]}
	}
	rw
}

#########################################
#  plot random walk of length n
plot.rwalk <- function(n=1000) {
	rw <- rwalk(n)
	plot(rw, type="l")
}

#########################################
#  plot POSITIVE random walk of length n
plot.posrwalk <- function(n=1000) {
	rw <- posrwalk(n)
	plot(rw, type="l")
}

# plot 12 random walks of length n
plot12rwalks <- function(n) {
	op <- par(mfrow=c(4, 3))
	for (i in 1:12) plot.rwalk(n)
	par(op)
}

############################################
# plot 12 POSITIVE random walks of length n
plot12posrwalks <- function(n=1000) {
	op <- par(mfrow=c(4, 3))
	for (i in 1:12) plot.posrwalk(n)
	par(op)
}

############################################
# plot 20 POSITIVE random walks of length n
plot20posrwalks <- function(n=1000) {
	op <- par(mfrow=c(5, 4))
	for (i in 1:20) plot.posrwalk(n)
	par(op)
}


# compare random walk with 2 smoothed walks  ... BUG at start of vector in 2nd smoothing
# rewrite using functions above
op <- par(mfrow=c(3, 1))
a <- 100
x <- rnorm(a)
for (i in 2:a) { x[i] <- x[i]+x[i-1] }
plot(x, type="l")
w <- 1  		# radius of smoothing window
xs <- x		# copy of data to be smoothed
for (i in 1+w:a-w) { xs[i] <- mean(c(x[i-w], x[i], x[i+w])) }	# needs w=1
plot(xs, type="l")
w <- 2  		# radius of smoothing window
for (i in 1+w:a-w) { xs[i] <- mean(c(x[i-w], x[i-1], x[i], x[i+1],x[i+w])) }	# needs w=2
plot(xs, type="l")
par(op)


# average of 5 random walks  -- TO DO: revise with loop over n random walks
a <- 1000
x1 <- rnorm(a)	# TO DO: make n vectors of length l with 
x2 <- rnorm(a)	# martix(rnorm(n * l), nrow=l, ncol=n)
x3 <- rnorm(a)
x4 <- rnorm(a)
x5 <- rnorm(a)
for (i in 2:a) { x1[i] <- x1[i-1]+x1[i] }
for (i in 2:a) { x2[i] <- x2[i-1]+x2[i] }
for (i in 2:a) { x3[i] <- x3[i-1]+x3[i] }
for (i in 2:a) { x4[i] <- x4[i-1]+x4[i] }
for (i in 2:a) { x5[i] <- x5[i-1]+x5[i] }
y <- (x1 + x2 + x3 + x4 + x5) / 5
plot(y, type="l")



# plot set of random walks ... plotting as you go
# 	n = number of random walks
# 	l = length of random walk
plot.nlwalks <- function(n,l) {
	plot (x <- rnorm(l), type="n", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	for (i in 1:n) lines (x <- rwalk(l))
}

###################################################################
# plot set of POSITIVE random walks ... plotting as you go
# 	n = number of random walks
# 	l = length of random walk
plot.posnlwalks <- function(n=20,l=1000) {
	plot (x <- rnorm(l), type="n", ylim=range(c(0, 3*sqrt(l))))
	for (i in 1:n) lines (x <- posrwalk(l))
}

# make matrix of random walks
nlwalks <- function (n,l) {
x <- rnorm(n*l)
m <- matrix(x, nrow=n, ncol=l)
for (i in 1:n) m[i,] <- rwalk(l)
m
}

# make matrix of POSITIVE random walks
posnlwalks <- function (n,l) {
x <- rnorm(n*l)
m <- matrix(x, nrow=n, ncol=l)
for (i in 1:n) m[i,] <- posrwalk(l)
m
}

# mean of n random walks of length l
mean.nlwalks <- function(n,l) {
	m <- nlwalks (n,l)
	for (i in 1:l) v[i] <- mean(m[,i])
	v
}

# plot set of random walks with mean in red
plot.nlwalks.mean <- function(n,l) {
	m <- nlwalks(n,l)				# the walks
	v <- m[1,]				# create v (not needed?)
	for (i in 1:l) v[i] <- mean(m[,i])		# mean of walks
	plot(m[1,], type="n", ylim=range(c(-(3*sqrt(l)), 3*sqrt(l))))
	for (i in 1:n) lines (m[i,])
	lines(v, col="red")
}

# plot set of POSITIVE random walks with mean in red
plot.posnlwalks.mean <- function(n,l) {
	m <- posnlwalks(n,l)			# the walks
	v <- m[1,]				# create v (not needed?)
	for (i in 1:l) v[i] <- mean(m[,i])		# mean of walks
	plot(m[1,], type="n", ylim=range(c(0, 3*sqrt(l))))
	for (i in 1:n) lines (m[i,])
	lines(v, col="red")
}


# histogram of many random walks (e.g., of a matrix)
hist.nlwalks <- function(n,l) {
	hist(x <- nlwalks(n,l))
}


# histogram of many random walks (e.g., of a matrix)
hist.posnlwalks <- function(n,l) {
	hist(x <- posnlwalks(n,l))
}

# plot and histogram of random walks
#  BUG?	not clear hist.nlwalks() is working correctly
plot.hist.nlwalks <- function (n=20,l=1000) {
	op <- par(mfrow=c(2, 1))
	plot.nlwalks(n,l)
	hist.nlwalks(n,l)
	par(op)
}

# plot and histogram of random walks
#  BUG?	not clear hist.nlwalks() is working correctly
plot.hist.posnlwalks <- function (n=20,l=1000) {
	op <- par(mfrow=c(2, 1))
	plot.posnlwalks(n,l)
	hist.posnlwalks(n,l)
	par(op)
}

<<<<<<< HEAD
=======

# TO DO plot "branching tree" of random walks
# TO DO	plot dynamic histogram of set or tree of random walks
# TO DO 	same, but with reflecting boundary at 0
# TO DO	same, but with steps (-1, 0, 1)
# TO DO	random phylogeny program, with extinction etc. (like McShea)
# TO DO	random phylogeny w/ optional bias toward "complexity"
#	check McShea tests for passive trends


# TO DO	tsplot
# BUG 	how to get dimensions of plot fit all data to come?
plot (m[1,], type="l")
for (i in 2:10) lines (m[i,])



##########################################################
#
# vector of species (say, 10,000) -- boolean if ever existed
# vector of whether or not extinct (0,1) -- boolean if ever went extinct
# vector of complexity measure (real? integer?)
# 
# start with one species




XXXXXXXXXXXXXXXX <- function(n,l) {
	m <- posnlwalks(n,l)			# the walks
	v <- m[1,]				# create v (not needed?)
	for (i in 1:l) v[i] <- mean(m[,i])		# mean of walks
	plot(m[1,], type="n", ylim=range(c(0, 3*sqrt(l))))
	for (i in 1:n) lines (m[i,])
	lines(v, col="red")
}


# histogram of many random walks (e.g., of a matrix)
hist.nlwalks <- function(n,l) {
	hist(x <- nlwalks(n,l))
}


# histogram of many random walks (e.g., of a matrix)
hist.posnlwalks <- function(n,l) {
	hist(x <- posnlwalks(n,l))
}

# plot and histogram of random walks
#  BUG?	not clear hist.nlwalks() is working correctly
plot.hist.nlwalks <- function (n=20,l=1000) {
	op <- par(mfrow=c(2, 1))
	plot.nlwalks(n,l)
	hist.nlwalks(n,l)
	par(op)
}

# plot and histogram of random walks
#  BUG?	not clear hist.nlwalks() is working correctly
plot.hist.posnlwalks <- function (n=20,l=1000) {
	op <- par(mfrow=c(2, 1))
	plot.posnlwalks(n,l)
	hist.posnlwalks(n,l)
	par(op)
}


# TO DO plot "branching tree" of random walks
# TO DO	plot dynamic histogram of set or tree of random walks
# TO DO 	same, but with reflecting boundary at 0
# TO DO	same, but with steps (-1, 0, 1)
# TO DO	random phylogeny program, with extinction etc. (like McShea)
# TO DO	random phylogeny w/ optional bias toward "complexity"
#	check McShea tests for passive trends


# TO DO	tsplot
# BUG 	how to get dimensions of plot fit all data to come?
plot (m[1,], type="l")
for (i in 2:10) lines (m[i,])



##########################################################
#
# vector of species (say, 10,000) -- boolean if ever existed
# vector of whether or not extinct (0,1) -- boolean if ever went extinct
# vector of complexity measure (real? integer?)
# 
# start with one species




>>>>>>> 1a2f2e473cd51669d809dc0ee695e243feaa97a6
