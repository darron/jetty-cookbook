#
# Cookbook Name:: jetty
# Recipe:: server
#

# Install Jetty.
user node[:jetty][:user] do
  comment "Jetty User"
  shell "/bin/false"
end

ark "jetty" do
  url node[:jetty][:url]
  path node[:jetty][:prefix]
  owner node[:jetty][:user]
  action :put
end

bash "jetty init script" do
  user "root"
  cwd "/etc"
  code <<-EOH
    cp #{node[:jetty][:path]}/bin/jetty.sh /etc/init.d/jetty
    chmod 755 /etc/init.d/jetty
  EOH
end

service "jetty" do
  action [ :enable ]
end

template "/etc/default/jetty" do
  source "jetty.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :java_path => node[:java][:path],
    :jetty_listen_ports => node[:jetty][:listen_ports],
    :jetty_user => node[:jetty][:user],
    :solr_path => node[:solr][:path]
  )
  action :create
  notifies :restart, "service[jetty]"
end

bash "remove insecure apps" do
  user "root"
  cwd "#{node[:jetty][:path]}/webapps"
  code <<-EOH
    rm -rf test.d/ test.war test.xml async-rest.war
  EOH
end

service "jetty" do
  action [ :start ]
end