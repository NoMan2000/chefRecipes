#Cookbook
# Recipe:: default
#copyright 2014, CellControl
# include_recipe "apache2:apachecookbook"
#First run apt-get update

if node["platform"] == "ubuntu"
    execute "apt-get update" do
      command "apt-get update"
    end
end
# Install Apache
# Package command, if it is installed it will install it.

apache_name = "httpd"

if node["platform"] == "ubuntu"
    apache_name == "apache2"
end

package apache_name do
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

# template "/var/www/html/index.html" do
#     source "index.html.erb"
#     mode "0644"
# end
