lock '3.14.1'

set :application, 'kiawase'

set :repo_url,  'git@github.com:ik425524/kiawase.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :linked_files, %w{ config/credentials.yml.enc }
set :linked_files, fetch(:linked_files, []).push("config/master.key")

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1' 

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/kiawase.pem'] 

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload credentials.yml.enc'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end