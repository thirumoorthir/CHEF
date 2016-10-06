#
# Cookbook Name:: Thiru-Apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package "httpd" do
	action :install
end

service "httpd" do
	action [:enable, :start]
end

# cookbook_file "/var/www/html/index.html" do
# 	source "index.html"
# 	mode "0644"	
# end

cookbook_file "/etc/hosts" do
	source "hosts"
	mode "0644"
end


cookbook_file "/var/www/html/index.html" do
	source node["apache"]["indexfile"]
	mode "0644"	
end

node.default["apache"]["indexfile"] = "index2.html"