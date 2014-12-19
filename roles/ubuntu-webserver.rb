# name "ubuntu-webserver"
# description "Install a webserver on ubuntu"
# run_list "recipe[apache::apt-get update]", "recipe[apache::install]", "recipe[apache::base-files]"
