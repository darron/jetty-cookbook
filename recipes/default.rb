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