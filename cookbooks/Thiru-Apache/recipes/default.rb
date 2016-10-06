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


# # cookbook_file "/var/www/html/index.html" do
# # 	source "index.html"
# # 	mode "0644"	
# # end

# cookbook_file "/etc/hosts" do
# 	source "hosts"
# 	mode "0644"
# end


# cookbook_file "/var/www/html/index.html" do
# 	source node["apache"]["indexfile"]
# 	mode "0644"	
# end

# node.default["apache"]["indexfile"] = "index2.html"

# Tasks :- 
# Iterate over the apache sites
# set the document root
# add a template to  

execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")# File.exist is an function from ruby, checks the presence of that file 
	end
	notifies :restart, "service[httpd]"
end
# Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|
# Set the doxument root 
	document_root = "/srv/apache/#{site_name}"
#Add a template for Apache virtual host configuration 
	template "/etc/httpd/conf.d/#{site_name}.conf" do 
		source "custom.erb"
		mode "0644"
		variables(
			:document_root => document_root,
			:port => site_data["port"]
			)
		    notifies :restart, "service[httpd]"
		end
#Add a directory resource to create the document_root
	directory document_root do
		mode "0755"
		recursive true
	end
#Add a template resource for the virtual host's index.html
	template "#{document_root}/index.html" do
		source "index.html.erb"
		mode "0644"
		variables(
			:site_name => site_name,
			:port => site_data["port"]
		)
	end
end


service "httpd" do
	action [:enable, :start]
end
