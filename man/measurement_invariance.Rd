% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measurement_invariance.R
\name{measurement_invariance}
\alias{measurement_invariance}
\title{Measurement Invariance}
\usage{
measurement_invariance(
  data,
  model = NULL,
  items = NULL,
  group,
  ordered = F,
  group_partial = NULL,
  invariance_level = "metric"
)
}
\arguments{
\item{data}{data frame}

\item{model}{explicit lavaan model. Either the `model` argument or the `items` argument must be specified.}

\item{items}{vector of tidyselect syntax or helpers. default to NULL if the model is specified. The argument will be ignored if the model is explicitly specified.}

\item{group}{character. group variable.}

\item{ordered}{logical. default is F. If it is set to T, lavaan will treat it as a ordinal variable and use DWLS instead of ML}

\item{group_partial}{items for partial equivalence. The form should be c('DV =~ item1', 'DV =~ item2').}

\item{invariance_level}{"metric" or "scalar". Default is 'metric'. Set as 'metric' for configural-metric comparison, and set as 'scalar' for configural-metric-scalar comparison.}
}
\value{
return the compareFit object
}
\description{
Compute the measurement invariance model (i.e., measurement equivalence model) using multigroup confirmatory factor analysis (MGCFA; Jöreskog, 1971). This function uses the lavaan::cfa (Rosseel, 2012) and the semTools::compareFit (Jorgensen, 2021) function. Users can run the configural-metric or the configural-metric-scalar comparisons (see below for detail instruction).
}
\examples{
# Fitting measurement invariance model by passing explicit lavaan model 
measurement_invariance(model = 'visual  =~ x1 + x2 + x3
                                textual =~ x4 + x5 + x6
                                speed   =~ x7 + x8 + x9 ',
                       data = lavaan::HolzingerSwineford1939,
                       group = 'school')

# Fitting a unifactor measurement invariance model by passing items. 
measurement_invariance(items = x1:x3,
                       data = lavaan::HolzingerSwineford1939,
                       group = 'school')

}
\references{
Jöreskog, K. G. (1971). Simultaneous factor analysis in several populations. Psychometrika, 36(4), 409-426.

Jorgensen, T. D., Pornprasertmanit, S., Schoemann, A. M., & Rosseel, Y. (2021). semTools: Useful tools for structural equation modeling. R package version 0.5-4. Retrieved from https://CRAN.R-project.org/package=semTools

Rosseel Y (2012). lavaan: An R Package for Structural Equation Modeling. Journal of Statistical Software, 48(2), 1–36. https://www.jstatsoft.org/v48/i02/.
}
