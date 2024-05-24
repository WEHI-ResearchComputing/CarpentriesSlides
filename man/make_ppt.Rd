% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/powerpoint.R
\name{make_ppt}
\alias{make_ppt}
\title{Convert a slide deck to a PowerPoint presentation}
\usage{
make_ppt(
  repo,
  extra_flags = character(),
  template = NULL,
  verbose = FALSE,
  open = TRUE
)
}
\arguments{
\item{repo}{Path to the git repository corresponding to a lesson that uses Carpentries Workbench.}

\item{extra_flags}{Character vector. Extra arguments to pass to \code{pandoc} to modify the conversion process
Path to the reveal JS postprocessing lua filter}

\item{verbose}{Logical scalar. TRUE if additional but non-essential logging should be provided.}

\item{open}{Logical scalar. TRUE if you want the slides to be opened in your browser after they are generated.}
}
\description{
Convert a slide deck to a PowerPoint presentation
}