\name{plotDEXSeq}
\alias{plotDEXSeq}
\title{Visualization of the per gene DEXSeq results.}
\description{
  The function provides a plot to visualize read count data,
  expression and exon usage coefficients estimated from fitting
  a GLM model 'counts ~ fitExpToVar * exon'. The model frame used
  can be found in \code{object@modelFrameBM}. One GLM is fitted
  for each gene.
}
\usage{
  plotDEXSeq(object, geneID, FDR=0.1, fitExpToVar="condition", 
    norCounts=FALSE, expression=TRUE, splicing=FALSE, 
    displayTranscripts=FALSE, names=FALSE, legend=FALSE, 
    color=NULL, color.samples=NULL, ...)
}
\arguments{
  \item{object}{
    An DEXSeqResults object.
  }
  \item{geneID}{
    Gene identifier to visualize.
  }
  \item{FDR}{
    A false discovery rate. 
  }
  \item{fitExpToVar}{
    A variable contained in the sample annotation of the \code{DEXSeqDataSet}, 
    the expression values will be fitted to this variable using the formula
    \code{count ~ fitExpToVar * exon}.  
  }
  \item{norCounts}{
    If TRUE, provides a plot of the counts normalized by the size factors.
  }
  \item{expression}{
    If TRUE, the function plots the fitted EXPRESSION estimates from the glm 
    regression.
  }
  \item{splicing}{
    If TRUE, the samples gene expression effects are averaged out, leaving
    only exon usage coefficients.
  }
  \item{displayTranscripts}{
    If TRUE, the transcripts are displayed in the plot.
  }
  \item{names}{
    If TRUE, the names of the transcripts are shown.
  }
  \item{legend}{
    If TRUE, a legend is displayed.
  }
  \item{color}{
    A vector of colors for each of the levels of the factor in the design of 
   the ExonCountSet object indicated by "fitExpToVar".
  }
  \item{color.samples}{
    A vector of colors for each of the samples. If NULL, the colors of each 
    sample will be assigned according to its corresponding level from "fitExpToVar". 
    This option is useful to visualize complex experimental designs.
  }
  \item{...}{
    Further graphical parameters (see \code{par}).
  }
}
\seealso{
  graphics, \code{segments}
}
\examples{
\dontrun{
  data(pasillaDEXSeqDataSet, package="pasilla")
  dxd <- estimateSizeFactors( dxd )
  dxd <- estimateDispersions( dxd )
  dxd <- testForDEU( dxd )
  dxr <- DEXSeqResults( dxd )

  plotDEXSeq( dxr, "FBgn0010909" )
}
}
