% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/types.R
\name{is_reference}
\alias{is_reference}
\title{Is an object referencing another?}
\usage{
is_reference(x, y)
}
\arguments{
\item{x, y}{R objects.}
}
\description{
There are typically two situations where two symbols may refer to
the same object.
\itemize{
\item R objects usually have copy-on-write semantics. This is an
optimisation that ensures that objects are only copied if
needed. When you copy a vector, no memory is actually copied
until you modify either the original object or the copy is
modified.

Note that the copy-on-write optimisation is an implementation
detail that is not guaranteed by the specification of the R
language.
\item Assigning an \link[=is_copyable]{uncopyable} object (like an
environment) creates a reference. These objects are never copied
even if you modify one of the references.
}
}
\examples{
# Reassigning an uncopyable object such as an environment creates a
# reference:
env <- env()
ref <- env
is_reference(ref, env)

# Due to copy-on-write optimisation, a copied vector can
# temporarily reference the original vector:
vec <- 1:10
copy <- vec
is_reference(copy, vec)

# Once you modify on of them, the copy is triggered in the
# background and the objects cease to reference each other:
vec[[1]] <- 100
is_reference(copy, vec)
}
\keyword{internal}
