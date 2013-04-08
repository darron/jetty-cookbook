name             "jetty"
maintainer       "Darron Froese"
maintainer_email "darron@froese.org"
license          "All rights reserved"
description      "Installs/Configures jetty for use with Solr"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "java"
depends "ark"
depends "firewall"