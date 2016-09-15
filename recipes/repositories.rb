node['pantry']['repositories'].each do |name, config|
  pantry_repository config['destination'] do
    repository config['source']
    user node['pantry']['user']
    group node['pantry']['group']
  end
end
