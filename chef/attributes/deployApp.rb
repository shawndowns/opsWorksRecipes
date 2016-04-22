# Play Stuff
default['play']['version'] = '' #Play Project Version must be provided
default['play']['project'] = '' #Play Project Name must be provided
default['play']['user'] = 'root'

# s3cmd Stuff
default['s3']['path'] = '' #path needs to be provided
default['s3']['accessKey'] = '' #accessKey needs to be provided
default['s3']['secretKey'] = '' #secretKey needs to be provided
default['s3']['passphrase'] = '' #passphrase needs to be provided
default['s3']['cfgDir'] = '/home/ubuntu'
default['env']

# Java Stuff
node['java']['install_flavor'] # Flavor of JVM you would like installed (oracle, oracle_rpm, openjdk, ibm, windows), default openjdk on Linux/Unix platforms, windows on Windows platforms.
node['java']['jdk_version'] # JDK version to install, defaults to '6'.
node['java']['java_home'] # Default location of the "$JAVA_HOME".
node['java']['set_etc_environment'] # Optionally sets JAVA_HOME in /etc/environment for Default false.
node['java']['openjdk_packages'] # Array of OpenJDK package names to install in the java::openjdk recipe. This is set based on the platform.
node['java']['tarball'] # Name of the tarball to retrieve from your internal repository, default jdk1.6.0_29_i386.tar.gz
node['java']['tarball_checksum'] # Checksum for the tarball, if you use a different tarball, you also need to create a new sha256 checksum
node['java']['jdk'] # Version and architecture specific attributes for setting the URL on Oracle's site for the JDK, and the checksum of the .tar.gz.
node['java']['oracle']['accept_oracle_download_terms'] = "true" # Indicates that you accept Oracle's EULA
node['java']['windows']['url'] # The internal location of your java install for windows
node['java']['windows']['package_name'] # The package name used by windows_package to check in the registry to determine if the install has already been run
node['java']['windows']['checksum'] # The checksum for the package to download on Windows machines (default is nil, which does not perform checksum validation)
node['java']['ibm']['url'] # The URL which to download the IBM JDK/SDK. See the ibm recipe section below.
node['java']['ibm']['accept_ibm_download_terms'] # Indicates that you accept IBM's EULA (for java::ibm)
node['java']['oracle_rpm']['type'] # Type of java RPM (jre or jdk), default jdk
node['java']['oracle_rpm']['package_version'] # optional, can be set to pin a version different from the up-to-date one available in the YUM repo, it might be needed to also override the node['java']['java_home'] attribute to a value consistent with the defined version
node['java']['oracle_rpm']['package_name'] # optional, can be set to define a package name different from the RPM published by Oracle.
node['java']['accept_license_agreement'] # Indicates that you accept the EULA for openjdk package installation.
node['java']['set_default'] # Indicates whether or not you want the JDK installed to be default on the system. Defaults to true.
node['java']['oracle']['jce']['enabled'] # Indicates if the JCE Unlimited Strength Jurisdiction Policy Files should be installed for oracle JDKs
node['java']['oracle']['jce']['home'] # Where the JCE policy files should be installed to
node['java']['oracle']['jce'][java_version]['checksum'] # Checksum of the JCE policy zip. Can be sha256 or md5
node['java']['oracle']['jce'][java_version]['url'] # URL which to download the JCE policy zip
