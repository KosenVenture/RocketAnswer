set :stage, :vagrant
set :rails_env, 'production'
set :migration_role, 'db'
set :uid, 'vagrant'
set :gid, 'vagrant'

server 'rocketanswer-vm',
  user: 'vagrant',
  roles: %w{web app db},
  ssh_options: {
    keys: [File.expand_path('~/.vagrant.d/insecure_private_key')],
    forward_agent: true,
    auth_methods: %w(publickey)
  }
