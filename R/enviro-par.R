#' S3 class enviro_par
#' @exportClass enviro_par
#

#' @param .x A list to be constructed into \strong{enviro_par}. If units are not provided, they will be set without conversion. If units are provided, they will be checked and converted to units that tealeaves uses.
#' 
#' @description 
#' 
#' Constructor function for enviro_par class. This function ensures that environmental parameter inputs are properly formatted.
#' 
#' @export

enviro_par <- function(.x) {
  
  which <- "enviro"
  nms <- tealeaves::parameter_names(which)
  
  stopifnot(is.list(.x))
  
  if (!all(nms %in% names(.x))) {
    nms[!(nms %in% names(.x))] %>%
      stringr::str_c(collapse = ", ") %>%
      glue::glue("{x} not in parameter names required for {which}",
                 x = ., which = which) %>%
      stop()
  }
  
  .x %<>% magrittr::extract(nms)
  
  # Set units ----
  .x$P %<>% set_units(kPa)
  .x$r %<>% set_units()
  .x$RH %<>% set_units()
  .x$S_sw %<>% set_units(W / m ^ 2)
  .x$T_air %<>% set_units(K)
  .x$wind %<>% set_units(m / s)
  
  # Check values ----
  stopifnot(.x$P >= set_units(0, kPa))
  stopifnot(.x$r >= set_units(0) & .x$r <= set_units(1))
  stopifnot(.x$RH >= set_units(0) & .x$RH <= set_units(1))
  stopifnot(.x$S_sw >= set_units(0, W / m ^ 2))
  stopifnot(.x$T_air >= set_units(0, K))
  stopifnot(.x$wind >= set_units(0, m / s))

  structure(.x, class = c(stringr::str_c(which, "_par"), "list"))
  
}

