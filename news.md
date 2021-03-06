# tealeaves (development version)

# tealeaves 1.0.1

* `constants()`, `enviro_par()`, and `leaf_par()` no longer require values be provided with units. If values are provided without units, they are assigned proper units, but no unit conversion is performed. If values have units, these functions check whether units are correct and convert them to units used in the package.

* Release to be archived with revision of "Is amphistomy an adaptation to high light? Optimality models of stomatal traits along light gradients."

* [Blog post.](http://dreamy-mcnulty-07a670.netlify.com/post/2019-11-21-phyteclub/)

# tealeaves 1.0.0

tealeaves implements models of leaf temperature using energy balance. It uses units to ensure that parameters are properly specified and transformed before calculations. It allows separate lower and upper surface conductances to heat and water vapor, so sensible and latent heat loss are calculated for each surface separately as in Foster and Smith (1986). It's straightforward to model leaf temperature over environmental gradients such as light, air temperature, humidity, and wind. It can also model leaf temperature over trait gradients such as leaf size or stomatal conductance.

* Added a `NEWS.md` file to track changes to the package.
