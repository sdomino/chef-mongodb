case node['mongodb']['install_type']
when 'package'
  # package 'mongodb-10gen'

  # i cant get the above to work, so im just going to do what will work for now
  execute 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10'
  cookbook_file '/etc/apt/sources.list.d/10gen.list'
  execute 'sudo apt-get update'
  execute 'sudo apt-get install mongodb-10gen'
  service 'mongodb' do
    action [:enable, :start]
  end
when 'source'
  include_recipe 'mongodb::source'
else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end