# OpsWorks Ubuntu/Java Cookbook

## Housekeeping:
These recipes are very specific to my use case (zipped dist on s3 accessible to OpsWorks layer only running Play Framework/java server). Please feel free to drop me a line if you need this to be more generic.

## Description:

Installs Java/unzip, downloads a java distribution from s3 (or other wget accessible address), installs the upstart and starts it.

## Requirements:
* Your distribution has to be accessible from your server. I use s3 and security groups to secure this..
* The upstart is also based on running a java server.

## Supported Platforms:

* Ubuntu 14+ (16.04 running in prod currently but will probably work on most versions)

## Dependencies:

* `java`
* `zip`

## Usage:

Designed to work with AWS OpsWorks and S3 to download, install and start a java server distribution.

## Attributes:

### Distribution Attributes:
1. `node['dist']['version'] = '' # [Optional] Version appended to the project name`
2. `node['dist']['project'] = '' # [Required] Project name`
2. `node['dist']['path'] = '' # [Required] Path to the project distribution`
3. `node['dist']['user'] = 'root' # [Optional] The user that will run the project from the upstart's perspective`
4. `default['dist']['dir']	= "/opt" # [Optional] Location of the unzipped dist`

####Example Attributes:
`default['dist']['version'] 	= '-2.1.0'												# [Optional] Version appended to the project name`
`default['dist']['project'] 	= 'some_proj_name' 										# [Required] Project name`
`default['dist']['path'] 	= 'https://s3.amazonaws.com/some/path/to/your/bucket' 	# [Required] Path to the project distribution`

####Remote Dist Location:
`https://s3.amazonaws.com/some/path/to/your/bucket/some_proj_name-2.1.0.zip`

### Upstart Environment Variables:
`node['env']`

####Example Attributes:
`default['env']['-Xmx'] = '1024m' # Example for java max memory setting`
`default['env']['-Dhttps.port'] = '=9443' # Example Play Framework https setting`

####Resulting Upstart Execution (based on Dist Attr Examples as well):
`/opt/some_proj_name-2.1.0/bin/some_proj_name -J-server -Xmx1024m -Dhttps.port=9443`

### Default Java Config (Checkout the [java cookbook](https://supermarket.chef.io/cookbooks/java) for more options):
1. `node["java"]["install_flavor"] = "oracle"`
2. `node["java"]["jdk_version"] = "8"`
3. `node["java"]["oracle"]["accept_oracle_download_terms"] = true`

## Contributing:

I, frankly, don't do this often so just drop me a line...

## Contact:

1. Email Me (im@shawndowns.com)
2. Use the contact us form at reactiveblue.com
