set :stage, :production

server 'lucas.tsi.pro.br', roles: %w(app web db), primary: true, user: 'deployer'
set :rails_env, "production"