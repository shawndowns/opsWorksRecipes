projectDir 		    = "/opt/#{node[:play][:project]}"
projectPackage      = "#{node[:play][:project]}-#{node[:play][:version]}"
gitHubURL           = node[:play][:url]
projectUrl          = gitHubURL + "/" + projectPackage + ".zip?raw=true"
play_user           = node[:play][:user]
s3cfgDir            = node[:s3][:cfgDir]

directory projectDir do
  action :create
  owner play_user
  mode 0755
end

template '/home/ubuntu/.s3cfg' do
  source 's3cfg.erb'
  owner play_user
  group play_user
  mode 0644
end