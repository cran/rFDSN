\name{rFDSN-package}
\alias{rFDSN-package}
\alias{rFDSN}
\docType{package}
\title{
Get seismic data from the International Federation of Digital Seismograph Networks
}
\description{
Gather information about seismic networks (stations, channels, locations, etc), download seismic time series in miniseed format, and find historical earthquake data (origins, magnitudes, etc).
}
\details{
\tabular{ll}{
Package: \tab rFDSN\cr
Type: \tab Package\cr
Version: \tab 0.0.0\cr
Date: \tab 2014-09-22\cr
License: \tab GPL v3\cr
}}
\author{
Daniel C. Bowman \email{daniel.bowman@unc.edu}
}
\references{
FDSN Web Services: \cr
\url{http://www.fdsn.org/webservices/} \cr
List of base URLS for data download:\cr
\url{http://www.fdsn.org/webservices/datacenters/} \cr
}
\keyword{ package }
\examples{
#Find all stations with operating vertical seismic channels
#within 2 degrees of Socorro, New Mexico,
#between 2010 and 2013
#available through the IRIS DMC server.

library(rFDSN)

\dontrun{

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
