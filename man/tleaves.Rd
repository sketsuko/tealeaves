% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tleaves.R
\name{tleaves}
\alias{tleaves}
\alias{tleaf}
\title{\code{tleaves}: find leaf temperatures for multiple parameter sets}
\usage{
tleaves(leaf_par, enviro_par, constants, progress = TRUE,
  quiet = FALSE, set_units = TRUE, parallel = FALSE)

tleaf(leaf_par, enviro_par, constants, quiet = FALSE, set_units = TRUE)
}
\arguments{
\item{leaf_par}{A list of leaf parameters. This can be generated using the \code{make_leafpar} function.}

\item{enviro_par}{A list of environmental parameters. This can be generated using the \code{make_enviropar} function.}

\item{constants}{A list of physical constants. This can be generated using the \code{make_constants} function.}

\item{progress}{Logical. Should a progress bar be displayed?}

\item{quiet}{Logical. Should messages be displayed?}

\item{set_units}{Logical. Should \code{units} be set? The function is faster when FALSE, but input must be in correct units or else results will be incorrect without any warning.}

\item{parallel}{Logical. Should parallel processing be used via \code{\link[furrr]{future_map}}?}
}
\value{
\code{tleaves}: \cr
\cr
A tibble with the following \code{units} columns \cr

\tabular{ll}{
\bold{Input:} \tab \cr
\code{abs_l} \tab Absorbtivity of longwave radiation (unitless) \cr
\code{abs_s} \tab Absorbtivity of shortwave radiation (unitless) \cr
\code{g_sw} \tab Stomatal conductance to H2O (\eqn{\mu}mol H2O / (m^2 s Pa)) \cr
\code{g_uw} \tab Cuticular conductance to H2O (\eqn{\mu}mol H2O / (m^2 s Pa)) \cr
\code{leafsize} Leaf characteristic dimension \tab (m) \cr
\code{logit_sr} \tab Stomatal ratio (logit transformed; unitless) \cr
\code{P} \tab Atmospheric pressure (kPa) \cr
\code{RH} \tab Relative humidity (unitless) \cr
\code{S_lw} \tab incident long-wave radiation flux density (W / m^2) \cr
\code{S_sw} \tab incident short-wave (solar) radiation flux density (W / m^2) \cr
\code{T_air} \tab Air temperature (K) \cr
\code{wind} \tab Wind speed (m / s) \cr
\bold{Output:} \tab \cr
\code{T_leaf} \tab Equilibrium leaf tempearture (K) \cr
\code{value} \tab Leaf energy balance (W / m^2) at \code{tleaf} \cr
\code{convergence} \tab Convergence code (0 = converged) \cr
\code{R_abs} \tab Total absorbed radiation (W / m^2; see \code{\link{.get_Rabs}}) \cr
\code{S_r} \tab Longwave re-radiation (W / m^2; see \code{\link{.get_Sr}}) \cr
\code{H} \tab Sensible heat flux density (W / m^2; see \code{\link{.get_H}}) \cr
\code{L} \tab Latent heat flux density (W / m^2; see \code{\link{.get_L}}) \cr
\code{E} \tab Evapotranspiration (mol H2O/ (m^2 s))
}

\code{tleaf}: \cr
\cr
A data.frame with the following numeric columns: \cr

\tabular{ll}{
\code{T_leaf} \tab Equilibrium leaf tempearture (K) \cr
\code{value} \tab Leaf energy balance (W / m^2) at \code{tleaf} \cr
\code{convergence} \tab Convergence code (0 = converged) \cr
\code{R_abs} \tab Total absorbed radiation (W / m^2; see \code{\link{.get_Rabs}}) \cr
\code{S_r} \tab Longwave re-radiation (W / m^2; see \code{\link{.get_Sr}}) \cr
\code{H} \tab Sensible heat flux density (W / m^2; see \code{\link{.get_H}}) \cr
\code{L}\tab Latent heat flux density (W / m^2; see \code{\link{.get_L}}) \cr
\code{E} \tab Evapotranspiration (mol H2O/ (m^2 s))
}
}
\description{
\code{tleaves}: find leaf temperatures for multiple parameter sets

\code{tleaf}: find leaf temperatures for a single parameter set
}
\examples{
# tleaf for single parameter set:

leaf_par <- make_leafpar()
enviro_par <- make_enviropar()
constants <- make_constants()
tleaf(leaf_par, enviro_par, constants)

# tleaves for multiple parameter set:

enviro_par <- make_enviropar(
  replace = list(
    T_air = set_units(c(293.15, 298.15), K)
  )
)
tleaves(leaf_par, enviro_par, constants)

}
