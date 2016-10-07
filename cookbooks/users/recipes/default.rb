#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# We are going to create  users using for loop and searching via "users" index
search("users", "*:*").each do | user_data| # for loop for searching  and executing the loop, user_data is variable 
	user user_data["id"] do
		comment user_data["comment"]
		uid user_data["uid"]
		gid user_data["gid"]
		home user_data["home"]
		shell user_data["shell"]
	end
end

include_recipe "users::groups"
#below is the default user add command 
# user 'a user' do
#   comment 'A random user'
#   uid '1234'
#   gid '1234'
#   home '/home/random'
#   shell '/bin/bash'
#   password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
# end