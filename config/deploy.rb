settings = YAML.load_file(File.expand_path('../settings.yml', __FILE__))['capistrano']

lock '3.4.0'

set :application,           settings['application']
set :config_example_suffix, '.example'
set :deploy_to,             "#{settings['deploy_to']}/#{settings['application']}"
set :linked_dirs,           fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/sockets')
set :linked_files,          fetch(:linked_files, []).push('config/settings.yml')
set :rack_env,              'production'
set :repo_url,              settings['repo_url']

before 'deploy:check:linked_files', 'config:push'
