##
 # Created By Shawn Downs
 # All attributes are injected by OpsWorks
 ##

# Distribution Attributes:
default['dist']['version'] 									= ''		# [Optional] Version appended to the project name
default['dist']['project'] 									= ''		# [Required] Project name
default['dist']['path'] 									= ''		# [Required] Path to the project distribution
default['dist']['user'] 									= 'root'	# [Optional] The user that will run the project from the upstart's perspective
default['dist']['dir']										= "/opt"	# [Optional] Location of the unzipped dist

# Upstart Environment Variables:
default['env']

# Default Java Config (Checkout the java cookbook (https://supermarket.chef.io/cookbooks/java) for more options):
default["java"]["install_flavor"]							= "oracle"	
default["java"]["jdk_version"]								= "8"
default["java"]["oracle"]["accept_oracle_download_terms"] 	= true