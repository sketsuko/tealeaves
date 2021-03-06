#' Get vector of parameter names
#' 
#' @param which A character string indicating which parameter names to retreive, "constants", "enviro", or "leaf". Partial matching allowed.
#' 
#' @examples 
#' parameter_names("leaf")
#' 
#' @export
#' 

parameter_names <- function(which) {
  
  which %>% 
    match.arg(c("constants", "enviro", "leaf")) %>%
    switch(
         leaf = c("abs_l", "abs_s", "g_sw", "g_uw", "leafsize", "logit_sr"),
         enviro = c("P", "r", "RH", "S_sw", "T_air", "wind"),
         constants = c("c_p","D_h0", "D_m0", "D_w0", "epsilon", "eT", "G",
                       "nu_constant", "R", "R_air", "s", "sh_constant")
    )
  
}
