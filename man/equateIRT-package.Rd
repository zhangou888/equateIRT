\name{equateIRT-package}
\alias{equateIRT-package}
\alias{equateIRT}
\docType{package}
\title{
	Direct, chain and average equating coefficients with standard errors
	using IRT methods.
}
\description{
	This package computes direct, chain and average (bisector) equating coefficients 
	with standard errors using IRT methods for dichotomous items. 
}
\details{
\tabular{ll}{
Package: \tab equateIRT\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-06-24\cr
License: \tab GPL (>= 2)\cr
}
Direct equating coefficients and their standard errors
between forms presenting common items  
can be computed using function \code{direc}.
The equating methods implemented are 
"mean-mean", "mean-gmean", "mean-sigma", "Haebara" and "Stocking-Lord".
Data containing item parameter estimates and their covariance
matrix should be previously organized using function \code{modIRT}.
Function \code{alldirec} computes all direct equating coefficients
(with standard errors) between all pairs of a list of forms.
Function \code{chainec} computes chain equating coefficients
(and standard errors)
given direct equating coefficients between forms directly linked.
Average equating coefficients with standard errors 
can be calculated using function \code{bisectorec}, that 
implements the (weighted) bisector method.
Three simulated datasets are available for illustrative purposes.
These datasets contain item parameter coefficients and their 
covariance matrix. In particular, \code{est3pl} concerns a 
three-parameter logistic model, \code{est2pl} regards a 
two-parameter logistic model, and \code{estrasch} refers to
a Rasch model.
}
\author{
	Michela Battauz
	
	Maintainer: Michela Battauz <michela.battauz@uniud.it>
}
\references{
	Battauz, M. (2013). IRT Test Equating in Complex Linkage Plans. 
	\emph{Psychometrika}, \bold{78}, 464--480.

	Holland, P.W. and Strawderman, W.E. (2011). How to average equating 
	functions if you must. In A.A. von Davier (Ed.), \emph{Statistical models for 
	test equating, scaling, and linking} (pp. 89--107). New York: Springer.

	Kolen, M.J. and Brennan, R.L. (2004). \emph{Test equating, scaling, 
	and linking: methods and practices}, 2nd ed., New York: Springer.

	Ogasawara, H. (2000). Asymptotic standard errors of IRT equating coefficients 
	using moments. \emph{Economic Review (Otaru University of Commerce)}, 
	\bold{51}, 1--23.

	Ogasawara, H. (2001). Standard Errors of Item Response Theory Equating/Linking
	by Response Function Methods. \emph{Applied Psychological Measurement}, 
	\bold{25}, 53--67.
}