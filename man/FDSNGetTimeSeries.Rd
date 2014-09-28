\name{FDSNGetTimeSeries}
\alias{FDSNGetTimeSeries}
\title{
Download sensor time series from FDSN.
}
\description{
This function gathers earthquake data from the International Federation of Digital Seismograph Networks in miniseed format.
The available subsetting parameters can be viewed by calling \code{\link{FDSNParameterList}}.
}
\usage{
FDSNGetTimeSeries(base.url, parameters, save.file = "result.mseed", 
    save.dir = ".", verbose = TRUE)
}
\arguments{
  \item{base.url}{
     The address of a FDSN server. 
}
  \item{parameters}{
      Time series selection parameters, see \code{\link{FDSNParameterList}} for available inputs and examples below for usage.
}
  \item{save.file}{
      What name to give the miniseed file when it has been downloaded.
}
\item{save.dir}{
     Where to save the miniseed file, defaults to the current directory.
}
\item{verbose}{
  If \code{TRUE}, download progress is displayed.
}
}
\value{
\item{file.name}{The location of the downloaded file}
}
\references{
\url{http://www.fdsn.org/webservices/}
}
\author{
Daniel C. Bowman \email{daniel.bowman@unc.edu}
}
\seealso{
\code{\link{FDSNParameterList}}
}
\examples{

\dontrun{

#Download pressure data at station Y22D on August 9, 2014

#IRIS data download server
base.url <- "http://service.iris.edu/fdsnws/dataselect/1/"
parameters <- list(
    name = c(
    "sta",
    "cha",
    "start",
    "end"),
    value = c(
    "Y22D", #Station name
    "BDF", #SEED channel name
    "2014-08-09T00:00:00.000", #Midnight GMT
    "2014-08-09T23:59:59.999") #Midnight GMT
   )
miniseed.file <- FDSNGetTimeSeries(base.url, parameters, save.file = "Y22D_BDF.mseed")


}
}
\keyword{ connection }
