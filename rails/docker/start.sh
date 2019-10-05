cd /rails
mkdir -p /log/unicorn/
mkdir -p /log/nginx/
mkdir -p /db/postgres/data
mkdir -p /db/mysql/data
pwd
ls -la
echo 'rake db:migrate'
bundle exec rake db:migrate
echo "RAILS_ENV:$RAILS_ENV"
if [ "$RAILS_ENV" = "development" ]
then
  echo 'just start container and wait connection.'
  tail -f /dev/null
else
  echo 'rake assets:precompile...'
  bundle exec rake assets:precompile
  echo 'start unicorn server.'
  rm /tmp/unicorn.pid
  bundle exec unicorn -c /rails/docker/unicorn.rb
fi
