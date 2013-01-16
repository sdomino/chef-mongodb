case node[:package]
when 'ubuntu'
  include_recipe 'apt'
  execute 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10'
  cookbook_file '/etc/apt/sources.list.d/10gen.list'
  include_recipe 'apt'
  execute 'sudo apt-get install mongodb-10gen'
when 'centos'
  include_recipe 'yum'
  include_recipe 'yum::epel'
  cookbook_file '/etc/yum.repos.d/10gen.repo'
  execute 'sudo yum install -y mongo-10gen mongo-10gen-server'
else 
  puts "sorry, source installs for #{node[:package]} is not yet supported."
end

service 'mongod' do
  action [:enable, :start]
end