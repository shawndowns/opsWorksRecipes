name 				"OpsWorks Recipies"
maintainer       	"Shawn Downs"
maintainer_email 	"im@shawndowns.com"
description      	"Installs/configures Play Framework"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          	"1.3-M1"

recipe "recipes::deployApp", "Configures s3cmd and downloads/installs the specified play dist on S3"

%w[ ubuntu ].each do |os|
  supports os
end

%w[ build-essential runit yum ].each do |cookbook|
  depends cookbook
end

depends "java"	# Required to run the Play App