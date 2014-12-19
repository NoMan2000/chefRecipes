#Cookbook
# Recipe:: default
#copyright 2014, CellControl

#First run apt-get update

execute "apt-get update" do
  command "apt-get update"
end

# Install Apache
# Package command, if it is installed it will install it.

package "apache2" do
  action :install
end

# Start the apache service and add to bootup

service "apache2" do
    action [:start, :enable]
end

#add the file for apache to serve.

# cookbook_file "/var/www/index.html" do
#     source "index.html"
#     mode "0644"
# end

