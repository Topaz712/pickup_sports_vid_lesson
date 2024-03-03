set -o errexit
bundle install
bundle exex rake db:migrate