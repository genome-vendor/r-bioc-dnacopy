\name{zoomIntoRegion}
\alias{zoomIntoRegion}
\title{Zoomed in view of genomic region}
\description{
  This program computes the frequency of gains and losses for each probe
  as a function of level of mad.
}
\usage{
  zoomIntoRegion(x, chrom, sampleid, maploc.start=NULL, maploc.end=NULL,
      pt.pch=NULL, pt.cex=NULL, pt.col=NULL, segcol=NULL, seglwd=NULL, ...)
}
\arguments{
  \item{x}{an object of class DNAcopy.}
  \item{chrom}{the chromosome in which the region lies.}
  \item{sampleid}{the sample of interest.}
  \item{maploc.start}{genomic start position of the region of interest.
    Default is the beginning of the chromosome.} 
  \item{maploc.end}{genomic end position of the region of interest.
    Default is the end of the chromosome.}
  \item{pt.pch}{the plotting character used for plotting the log-ratio
    values (default is ".").}
  \item{pt.cex}{the size of plotting character used for the log-ratio
    values (default is 3 if "." and 1 otherwise).}
  \item{pt.col}{the color used for the points. Default is green3.}
  \item{segcol}{the color of the lines indicating the segment means. If
    missing the line color is set to be red.} 
  \item{seglwd}{line weight of lines for segment mean and zeroline.  If
    missing it is set to 3.}
  \item{...}{additional plotting options.}
}
\details{
  This command plots the region of interest with the log-ratio and
  segments.  It works for a region from a single chromosome in a single
  sample.  So if more than one chromosome and/or one sample are given
  only the first chromosome from the first sample will be used.
}

\examples{
data(coriell)

#Combine into one CNA object to prepare for analysis on Chromosomes 1-23

CNA.object <- CNA(cbind(coriell$Coriell.05296,coriell$Coriell.13330),
                  coriell$Chromosome,coriell$Position,
                  data.type="logratio",sampleid=c("c05296","c13330"))

#We generally recommend smoothing single point outliers before analysis
#Make sure to check that the smoothing is proper

smoothed.CNA.object <- smooth.CNA(CNA.object)

#Segmentation at default parameters

segment.smoothed.CNA.object <- segment(smoothed.CNA.object, verbose=1)

zoomIntoRegion(segment.smoothed.CNA.object, chrom=10, sampleid="c05296")
}

\author{Venkatraman E. Seshan \email{seshanv@mskcc.org} }

\keyword{nonparametric}
