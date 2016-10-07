# this is the base role for entire environemt , when ever an machine comes to online.
# This is the first role an machine process after first boot up ,
name "base-role"
description "Base Server role  for my entire environment "
run_list "recipe[chef-client]","recipe[MOTD]", "recipe[Thiru-Apache]","recipe[users]"