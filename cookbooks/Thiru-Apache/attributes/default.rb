# Now we hace to create an default attribute using attributes folder
default["apache"]["indexfile"] = "index1.html"
default["apache"]["sites"]["clowns"] = { "port" => 80 }
default["apache"]["sites"]["bears"] = { "port" => 81 }
default["apache"]["sites"]["dear"] = { "port" => 82 }

# we created two attributes to run two differe nt sites in two different port