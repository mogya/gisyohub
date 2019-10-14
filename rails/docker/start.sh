cd /rails
mkdir -p /log/rails/

echo "RAILS_ENV:$RAILS_ENV"
if [ "$RAILS_ENV" = "development" ]
then
  echo 'just start container and wait connection.'
  # pwd
  # ls -la
  tail -f /dev/null
else
  echo 'rake db:migrate'
  bin/rake db:migrate
  echo 'rake assets:precompile...'
  bin/rake assets:precompile
  echo 'start unicorn server.'
  rm /tmp/unicorn.pid
  bundle exec unicorn -c /rails/docker/unicorn.rb
fi
