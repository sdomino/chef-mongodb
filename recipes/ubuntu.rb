case node['mongodb']['install_type']
when 'package'
  include_recipe 'apt'
  package 'mongodb-10gen'
  service 'mongodb' do
    action [:enable, :start]
  end
when 'source'
  include_recipe 'mongodb::source'
else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end