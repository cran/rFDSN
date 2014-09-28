\name{FDSNGetEvents}
\alias{FDSNGetEvents}
\title{
Download earthquake data from FDSN.
}
\description{
This function gathers earthquake data from the International Federation of Digital Seismograph Networks.
The available subsetting parameters can be viewed by calling \code{\link{FDSNParameterList}}.
}
\usage{
FDSNGetEvents(base.url, parameters,verbose = TRUE)
}
\arguments{
  \item{base.url}{
     The address of a FDSN server. 
}
  \item{parameters}{
      Selection parameters to subset results, see \code{\link{FDSNParameterList}} for available inputs and examples below for usage.
}
  \item{verbose}{
  If \code{TRUE}, print the URL used to gather the earthquake data.  Default \code{TRUE}.
}
}
\value{
\item{event}{A structure with event location and magnitude information}
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

#Get all earthquakes within 2 degrees of Socorro, new Mexico, 
#between 2010 and 2013

#IRIS event server
base.url <- "http://service.iris.edu/fdsnws/event/1/"

#Selection criteria
parameters <- list(
    name = c(
    "latitude",
    "longitude",
    "maxradius",
    "start",
    "end"),
    value = c(
    34.068110, #Latitude
    -106.901847, #Longitude
    2, #Degrees from center point
    "2010-01-01", #Start time
    "2014-01-01") #End time
    )

events <- FDSNGetEvents(base.url, parameters)


}
}
\keyword{ connection }
