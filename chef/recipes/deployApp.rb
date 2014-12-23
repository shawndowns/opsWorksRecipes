projectDir 		    = "/opt/#{node[:play][:project]}"
projectPackage      = "#{node[:play][:project]}-#{node[:play][:version]}"
play_user           = node[:play][:user]
s3cfgDir            = node[:s3][:cfgDir]

directory projectDir do
  action :create
  owner play_user
  mode 0755
end

execute "install-project" do
    user play_user
    cwd projectDir
    command <<-EOH
    sudo s3cmd get s3://reactiveblue/#{projectPackage}.zip #{projectPackage}.zip
    unzip #{projectPackage}.zip
    chmod 0755 #{projectDir}/#{projectPackage}
    EOH
    action :nothing
end

execute "start-project" do
    user play_user
    command <<-EOH
    sudo service #{node[:play][:project]} start
    EOH
    action :nothing
end


template '/root/.s3cfg' do
  source 's3cfg.erb'
  owner play_user
  group play_user
  variables({
     :accessKey => node[:s3][:accessKey],
     :secretKey => node[:s3][:secretKey],
     :passphrase => node[:s3][:passphrase]
  })
  notifies :run, "execute[install-project]", :immediately
  mode 0644
end

template "/etc/init/#{node[:play][:project]}.conf" do
  source 'init.conf.erb'
  owner play_user
  group play_user
  variables({
     :projectName => node[:play][:project],
     :projectVersion => node[:play][:version],
     :sendgrid_username => node[:sendgrid][:username]
     :sendgrid_password => node[:sendgrid][:password]
  })
  notifies :run, "execute[start-project]", :immediately
  mode 0644
end