\name{mergeAlleleAssignments}
\alias{mergeAlleleAssignments}
\title{
Merge Allele Assignment Matrices
}
\description{
In cases where multiple populations are used separately to assign
alleles to homeologous loci, \code{mergeAlleleAssignments} is used to
consolidate the results.
}
\usage{
mergeAlleleAssignments(x)
}
\arguments{
  \item{x}{
A list, where each element is in the format of results produced by
\code{\link{catalanAlleles}} or \code{\link{testAlGroups}}; see example.
}
}
%\details{

%}
\value{
A list in similar format to \code{x}, but with only one element per locus.
}

\author{
Lindsay V. Clark
}


\seealso{
\code{\link{testAlGroups}}, \code{\link{catalanAlleles}},
\code{\link{recodeAllopoly}} 
}
\examples{
# List of allele assignment results for this example; normally these
# would be produced by other functions evaluating a genetic dataset.
# The example below is for an allotetraploid.

# Locus L1 is a well-behaved locus with no homoplasy.
myresults <- list(list(locus="L1", SGploidy=2,
                  assignments=matrix(c(1,0,0,1,1,0,0,1,0,1), nrow=2,
                  ncol=5, dimnames=list(NULL,
                  c("124","128","130","134","138")))),
                  list(locus="L1", SGploidy=2,
                  assignments=matrix(c(0,1,1,0,1,0,0,1), nrow=2, ncol=4,
                  dimnames=list(NULL, c("124","128","132","140")))),
                  list(locus="L1", SGploidy=2,
                  assignments=matrix(c(0,1,1,0,0,1,1,0), nrow=2, ncol=4,
                  dimnames=list(NULL, c("126","128","130","132")))),
# Locus L2 is unresolvable because there are no shared alleles between
# populations.
                  list(locus="L2", SGploidy=2,
                  assignments=matrix(c(1,0,1,0,0,1), nrow=2, ncol=3,
                  dimnames=list(NULL, c("205","210","225")))),
                  list(locus="L2", SGploidy=2,
                  assignments=matrix(c(1,0,0,1,0,1,1,0), nrow=2, ncol=4,
                  dimnames=list(NULL, c("195","215","220","230")))),
# Locus L3 has homoplasy that makes it unresolvable.
                  list(locus="L3", SGploidy=2,
                  assignments=matrix(c(1,0,0,1,0,1,1,0), nrow=2, ncol=4,
                  dimnames=list(NULL, c("153","159","168","171")))),
                  list(locus="L3", SGploidy=2,
                  assignments=matrix(c(1,0,0,1,1,0,0,1), nrow=2, ncol=4,
                  dimnames=list(NULL, c("153","156","165","171")))),
# Locus L4 has homoplasy, but the results can still be merged.
                  list(locus="L4", SGploidy=2,
                  assignments=matrix(c(1,0,1,0,0,1,0,1,0,1), nrow=2, ncol=5,
                  dimnames=list(NULL, c("242","246","254","260","264")))),
                  list(locus="L4", SGploidy=2,
                  assignments=matrix(c(1,0,0,1,1,0,0,1,0,1), nrow=2, ncol=5,
                  dimnames=list(NULL, c("242","246","250","254","260"))))
                  )
myresults

# merge within loci
mergedresults <- mergeAlleleAssignments(myresults)
mergedresults
}
\keyword{ manip }

