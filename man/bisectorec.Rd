\name{bisectorec}
\alias{bisectorec}
\alias{print.meqc}
\title{
	Bisector Equating Coefficients
}
\description{
	Calculates average equating coefficients using the bisector method 
	and standard errors
	given a set of direct and chain equating coefficients.
}
\usage{
bisectorec(ecall, mods = NULL, weighted = TRUE, unweighted = TRUE)
}
\arguments{
	\item{ecall}{
	list of objects of class \code{eqc} or \code{ceqc} 
	returned by functions
	\code{\link{direc}} and \code{\link{chainec}}.
	}
	\item{mods}{
	an object of class \code{modIRT} containing 
	item parameter coefficients and their covariance matrix
	of the forms to be equated. From version 2.0 it can be \code{NULL}
	}
	\item{weighted}{
	logical; if TRUE weighted bisector coefficients are computed.
	}
	\item{unweighted}{
	logical; if TRUE unweighted bisector coefficients are computed.
	}
}
\value{
	An object of class \code{meqc} with components
	\item{coef}{data frame containing \code{link}, \code{path},
		coefficient \code{A}, coefficient \code{B}, 
		standard error of coefficient A (\code{seA}), standard error of 
		coefficient B (\code{seB}) and \code{weights} of direct, chain and bisector 
		equating coefficients.}
	\item{method}{the equating method used.}
}
\references{
	Battauz, M. (2013). IRT Test Equating in Complex Linkage Plans. 
	\emph{Psychometrika}, \bold{78}, 464--480.

	Battauz, M. (2015). equateIRT: An R Package for IRT Test Equating.
	\emph{Journal of Statistical Software}, \bold{68}, 1--22.
	
	Holland, P.W. and Strawderman, W.E. (2011). How to average equating 
	functions if you must. In A.A. von Davier (Ed.), \emph{Statistical models for 
	test equating, scaling, and linking} (pp. 89--107). New York: Springer.
}
\author{
	Michela Battauz
}

\seealso{
	\code{\link{chainec}}, \code{\link{convert}}, \code{\link{direc}}, \code{\link{eqc}}, \code{\link{summary.meqc}}
}
\examples{
# three-parameter logistic model
# direct equating coefficients using the "Stocking-Lord" method
data(est3pl)
test <- paste("test", 1:5, sep = "")
mod3pl <- modIRT(coef = est3pl$coef, var = est3pl$var, names = test, display = FALSE)
direclist3pl <- alldirec(mods = mod3pl, method = "Stocking-Lord")
# compute chain equating coefficients for path 1,2,3,4,5
pth3 <- paste("test", 1:5, sep = "")
# pth3 <- data.frame(t(pth3), stringsAsFactors = FALSE) no more necessary
chainec3 <- chainec(direclist = direclist3pl, pths = pth3)
# create a list of objects of class eqc or ceqc
ecall <- c(chainec3, direclist3pl["test1.test5"])
# compute bisector and weighted bisector coefficients
allec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)
summary(allec)

# two-parameter logistic model
# direct equating coefficients using the "Haebara" method
data(est2pl)
test <- paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
direclist2pl <- alldirec(mods = mod2pl, method = "Haebara")
# compute chain equating coefficients for path 1,2,3,4
pth1 <- paste("test", 1:4, sep = "")
#pth1 <- data.frame(t(pth1), stringsAsFactors = FALSE)  no more necessary
chainec1 <- chainec(direclist = direclist2pl, pths = pth1)
# compute chain equating coefficients for path 1,5,4
pth2 <- c(paste("test", c(1,5,4), sep = ""))
# pth2 <- data.frame(t(pth2), stringsAsFactors = FALSE) no more necessary
chainec2 <- chainec(direclist = direclist2pl, pths = pth2)
# compute chain equating coefficients for path 1,2,3,4,5
pth3 <- paste("test", 1:5, sep = "")
#pth3 <- data.frame(t(pth3), stringsAsFactors = FALSE) no more necessary
chainec3 <- chainec(direclist = direclist2pl, pths = pth3)
# create a list of objects of class eqc or ceqc
ecall <- c(chainec1, chainec2, chainec3, direclist2pl["test1.test5"])
# compute bisector and weighted bisector coefficients
allec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)
summary(allec)

# Rasch model
# direct equating coefficients using the "mean-mean" method
data(estrasch)
test <- paste("test", 1:5, sep = "")
modrasch <- modIRT(coef = estrasch$coef, var = estrasch$var, names = test, 
	display = FALSE)
direclistrasch <- alldirec(mods = modrasch, method = "mean-mean", all = TRUE)
# compute chain equating coefficients for path 1,2,3,4
pth1 <- paste("test", 1:4, sep = "")
# pth1 <- data.frame(t(pth1), stringsAsFactors = FALSE) no more necessary
chainec1 <- chainec(direclist = direclistrasch, pths = pth1)
# compute chain equating coefficients for path 1,5,4
pth2 <- c(paste("test", c(1,5,4), sep = ""))
#pth2 <- data.frame(t(pth2), stringsAsFactors = FALSE) no more necessary
chainec2 <- chainec(direclist = direclistrasch, pths = pth2)
# create a list of objects of class eqc or ceqc
ecall <- c(chainec1, chainec2)
# compute bisector and weighted bisector coefficients
allec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)
summary(allec)
}
