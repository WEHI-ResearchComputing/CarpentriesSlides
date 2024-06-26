% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reveal.R
\name{make_reveal}
\alias{make_reveal}
\title{Converts a slide deck to an HTML slideshow}
\usage{
make_reveal(
  repo,
  slides_md = file.path(repo, "slides.md"),
  output = file.path(normalizePath(repo), "slides.html"),
  extra_flags = character(),
  verbose = FALSE,
  open = TRUE
)
}
\arguments{
\item{repo}{Path to the git repository corresponding to a lesson that uses Carpentries Workbench.}

\item{slides_md}{Optional output from \link{make_md} indicating where the slide markdown source is found.
By default, this function looks in the repo for the slides}

\item{output}{An optional path indicating where the resulting slideshow should be written.
Character scalar. If not provided, the slides will be saved into the lesson's git repository.}

\item{extra_flags}{Character vector. Extra arguments to pass to \code{pandoc} to modify the conversion process}

\item{verbose}{Logical scalar. TRUE if additional but non-essential logging should be provided.}

\item{open}{Logical scalar. TRUE if you want the slides to be opened in your browser after they are generated.}
}
\value{
The path to the output slides, invisibly.
Path to the reveal JS postprocessing lua filter
}
\description{
Converts a slide deck to an HTML slideshow
}
