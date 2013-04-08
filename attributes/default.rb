default['java']['jdk_version'] = '7'

default[:java][:path] = "/usr/lib/jvm/default-java"

default[:jetty][:prefix] = "/opt"
default[:jetty][:path] = "/opt/jetty"
default[:jetty][:listen_ports] = "8080"
default[:jetty][:user] = "jetty"
default[:jetty][:group] = "jetty"
default[:jetty][:url] = "http://10.0.1.10:8080/jetty.tar.gz"

default[:solr][:prefix] = "/opt"
default[:solr][:path] = "/opt/solr"