include_recipe 'java'
include_recipe 'zip'

projectPackage      = "#{node[:dist][:project]}#{node[:dist][:version]}"

remote_file '/tmp/#{projectPackage}.zip' do
  source '#{node[:dist][:path]}/#{projectPackage}.zip'
  mode '0755'
  action :create
  notifies :run, "execute[unzip]", :immediately
end

execute "unzip" do
  user node[:dist][:user]
  group node[:dist][:user]
  cwd node[:dist][:dir]
  action :nothing
  command "unzip /tmp/#{projectPackage}.zip"
end

template "/etc/init/#{node[:dist][:project]}.conf" do
  source 'init.conf.erb'
  owner node[:dist][:user]
  group node[:dist][:user]
  variables({
     :projectName => node[:play][:project],
     :projectVersion => node[:play][:version],
     :env => node[:env]
  })
  notifies :run, "execute[start-project]", :immediately
  mode 0644
end

execute "start-project" do
    user play_user
    command <<-EOH
    sudo service #{node[:play][:project]} start
    EOH
    action :nothing
end