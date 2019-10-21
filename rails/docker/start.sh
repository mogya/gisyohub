cd /rails
mkdir -p /log/rails/

echo "RAILS_ENV:$RAILS_ENV"
if [ "$RAILS_ENV" = "development" ]
then
  # pwd
  # ls -la
  bin/setup
  bin/rails s -b 0.0.0.0 &
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
