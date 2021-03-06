% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_file_path}
\alias{get_file_path}
\title{Utility function that generates file paths}
\usage{
get_file_path(years, months, types, path)
}
\arguments{
\item{years}{a numeric vector giving the years. The default is the most recent year.}

\item{months}{a numeric vector giving the months. The default is January to December.}

\item{types}{a character vector giving the type of taxi trip data of \code{yellow}}

\item{path}{path to desired file}
}
\description{
Take in arguments common to all three functions 
(e.g. years, months, types) as well as the stem of the URL and 
return the matched file paths.
}
\examples{
get_file_path(2017, 1:6, "yellow", "~/")

}
