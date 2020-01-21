echo "RAILS_ENV:$RAILS_ENV"
if [ "$RAILS_ENV" = "development" ]
then
  # pwd
  # ls -la
  bin/setup
  /bin/bash && tail -f /dev/null
else
  bin/setup
  echo 'start unicorn server.'
  rm -f /tmp/unicorn.pid
  bundle exec unicorn -c /rails/docker/unicorn.rb
fi
