require File.expand_path('../support/helpers', __FILE__)

describe 'jetty::default' do

  include Helpers::Jetty

  # Example spec tests can be found at http://git.io/Fahwsw
  
  it "installs the openjdk-7-jdk package" do
    package("openjdk-7-jdk").must_be_installed
  end
  
  it 'should make sure java is installed' do
  	assert_file "/usr/lib/jvm/default-java/jre/bin/java", "root", "root", "755"
  end
  
  it "creates a user for the daemon to run as" do
    user(node[:jetty][:user]).must_exist
  end
  
  it "creates the jetty directory" do
    directory(node[:jetty][:path]).must_exist.with(:owner, node[:jetty][:user])
    assert_directory "#{node[:jetty][:path]}", "#{node[:jetty][:user]}", "root", 0755
  end
  
  it "creates a jetty init script" do
    assert_file "/etc/init.d/jetty", "root", "root", "755"
  end
  
  it "creates a jetty config script" do
    assert_file "/etc/default/jetty", "root", "root", "644"
  end
  
  it "sets jetty to start" do
    file('/etc/default/jetty').must_include 'NO_START=0'
  end
  
  it "boots on startup" do
    service("jetty").must_be_enabled
  end
  
  it "runs as a daemon" do
    service("jetty").must_be_running
  end

end
