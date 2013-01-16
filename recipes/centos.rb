case node['mongodb']['install_type']
when 'package'
  include_recipe 'yum'
  cookbook_file '/etc/yum.repos.d/10gen.repo'

  # package 'mongo-10gen mongo-10gen-server' do
  #   action :install
  #   options '-y'
  # end

  # i cant get the above to work, so im just going to do what will work for now
  execute 'yum install -y mongo-10gen mongo-10gen-server'
  service 'mongod' do
    action [:enable, :start]
  end
when 'source'
  include_recipe 'mongodb::source'
else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end