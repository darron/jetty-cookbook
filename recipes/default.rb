#
# Cookbook Name:: jetty
# Recipe:: default
#
# Copyright (C) 2013 Darron Froese
# 
# All rights reserved - Do Not Redistribute
#

# Make sure Java 7 is installed.
include_recipe "java::default"

# Install the Jetty Server
include_recipe "jetty::server"

# Open Port 8080.
firewall "ufw" do
  action :enable
end

firewall_rule "http" do
  port 8080
  action :allow
  notifies :enable, "firewall[ufw]"
end