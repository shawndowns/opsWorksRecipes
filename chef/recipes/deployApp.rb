play2Home       = node[:play2][:home]
destinationName = "play-#{node[:play2][:version]}"
play_user = node[:play2][:user]
zipName         = destinationName+".zip"
destinationPath = play2Home+"/"+destinationName 
archiveFile     = play2Home+"/"+zipName

package "zip"
package "unzip"

directory play2Home do
  action :create
  owner play_user
  mode 0755
end

execute "install-play2" do
    user play_user
    cwd play2Home
    command <<-EOH
    unzip play-#{node[:play2][:version]}.zip
    ln -sf #{destinationPath}/play /usr/bin/play
    chmod 0755 #{destinationPath}/play
    EOH
    action :nothing
end

remote_file "#{play2Home}/play-#{node[:play2][:version]}.zip" do
    source node[:play2][:url]+node[:play2][:version]+"/#{zipName}"
    checksum node[:play2][:checksum]
    owner play_user
    mode "0644"
    notifies :run, "execute[install-play2]", :immediately
    action :create_if_missing
end