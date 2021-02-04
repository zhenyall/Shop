server "161.35.216.168", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "gh-shop"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "161.35.216.168"
set :puma_conf, "#{shared_path}/config/puma.rb"