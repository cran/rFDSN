\name{FDSNParameterList}
\alias{FDSNParameterList}
\title{
Subset options for FDSN
}
\description{
A list and description of subset options for \code{\link{FDSNGetEvents}}, \code{\link{FDSNGetNetworks}}, and \code{\link{FDSNGetTimeSeries}}.
}
\usage{
FDSNParameterList(interface)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{interface}{Whether to show parameter list for \code{"station"}, \code{"dataselect"} or \code{"event"}.
}
}
\value{
    \item{parameters}{A list describing the parameters available for data subsetting through FDSN}
}
\author{
Daniel C. Bowman \email{daniel.bowman@unc.edu}
}

\seealso{
\code{\link{FDSNGetEvents}}, \code{\link{FDSNGetNetworks}}, \code{\link{FDSNGetTimeSeries}}
}
\examples{


station.params <- FDSNParameterList("station")
timeseries.params <- FDSNParameterList("dataselect")
event.params <- FDSNParameterList("event")

}
\keyword{ documentation }
