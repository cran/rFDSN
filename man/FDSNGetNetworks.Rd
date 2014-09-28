\name{FDSNGetNetworks}
\alias{FDSNGetNetworks}
\title{
Download network and station data from FDSN.
}
\description{
This function gathers information about stations and networks from the International Federation of Digital Seismograph Networks.
The available subsetting parameters can be viewed by calling \code{\link{FDSNParameterList}}.
}
\usage{
FDSNGetNetworks(base.url, parameters,verbose = TRUE)
}
\arguments{
  \item{base.url}{
     The address of a FDSN server. 
}
  \item{parameters}{
      Selection parameters to subset results, see \code{\link{FDSNParameterList}} for available inputs and examples below for usage.
}
  \item{verbose}{
  If \code{TRUE}, print the URL used to gather the station and network.  Default \code{TRUE}.
}
}
\value{
\item{network}{A structure with seismic network information}
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

#Find all stations with operating vertical seismic channels
#within 2 degrees of Socorro, New Mexico,
#between 2010 and 2013
#available through the IRIS DMC server.

#IRIS station server
base.url <- "http://service.iris.edu/fdsnws/station/1/"

#Selection criteria
parameters <- list(
    name = c(
    "latitude",
    "longitude",
    "maxradius",
    "cha",
    "start",
    "end"),
    value = c(
    34.068110, #Latitude
    -106.901847, #Longitude
    2, #Degrees from center point
    "*Z",#Channel (with wildcards)
    "2010-01-01", #Start time
    "2014-01-01") #End time
    )

networks <- FDSNGetNetworks(base.url, parameters)


}
}
\keyword{ connection }
