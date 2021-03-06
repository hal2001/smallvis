% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smallvis.R
\name{smallvis_rep}
\alias{smallvis_rep}
\title{Best t-SNE Result From Multiple Initializations}
\usage{
smallvis_rep(nrep = 10, keep_all = FALSE, ...)
}
\arguments{
\item{nrep}{Number of repeats.}

\item{keep_all}{If \code{TRUE}, then the return value is a list of lists,
indexed from 1 .. \code{nrep}, with each entry the result from each
\code{\link{smallvis}} run. Otherwise just the result with the lowest error
is returned.}

\item{...}{Arguments to apply to each \code{\link{smallvis}} run.}
}
\value{
The \code{\link{smallvis}} result with the lowest final cost, or
if \code{keep_all} is \code{TRUE} all results as a list, indexed as 1 ..
\code{nrep}. If \code{ret_extra} is not \code{FALSE}, then the final costs for all
\code{nrep} runs are also included in the return value list as a vector
called \code{all_costs}. In this case, if \code{keep_all} is \code{TRUE}, then
\code{all_costs} appears as an extra item on all results. Additionally,
each result will have an extra entry \code{best_rep}, giving the index of the
result with the lowest cost.
}
\description{
Run t-SNE multiple times from a random initialization, and return the
embedding with the lowest cost.
}
\details{
This function ignores any value of \code{Y_init} you set, and uses
\code{Y_init = "rand"}.
}
\examples{
\dontrun{
# Return best result out of five random initializations
tsne_iris_best <- smallvis_rep(nrep = 5, X = iris, perplexity = 50, method = "tsne",
                               ret_extra = TRUE)
# How much do the costs vary between runs?
range(tsne_iris_best$all_costs)
# Display best embedding found
plot(tsne_iris_best$Y)

# Keep all results
# First result is in tsne_iris_rep[[1]], second in tsne_iris_rep[[2]] etc.
tsne_iris_rep <- smallvis_rep(nrep = 5, X = iris, perplexity = 50, method = "tsne",
                              ret_extra = TRUE, keep_all = TRUE)
# Index of result with smallest error is in special list item 'best_rep'
best_iris <- tsne_iris_rep[[tsne_iris_rep[[1]]$best_rep]]

}
}
