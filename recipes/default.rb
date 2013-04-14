#
# Cookbook Name:: jetty
# Recipe:: default
#

# Make sure Java 7 is installed.
include_recipe "java::default"

# Install the Jetty Server
include_recipe "jetty::server"