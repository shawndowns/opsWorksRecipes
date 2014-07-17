projectDir 		    = "/opt/#{node[:play][:project]}"
projectPackage      = "#{node[:play][:project]}-#{node[:play][:version]}"
gitHubURL           = node[:play][:url]
projectUrl          = gitHubURL + "/" + projectPackage + ".zip?raw=true"
play_user           = node[:play][:user]

directory projectDir do
  action :create
  owner play_user
  mode 0755
end

user play_user
cwd projectDir
command <<-EOH
unzip #{projectPackage}.zip
chmod 0755 #{projectDir}/#{projectPackage}
EOH