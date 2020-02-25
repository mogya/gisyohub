echo "RAILS_ENV:$RAILS_ENV"
echo "PORT:$PORT"
rm -f tmp/pids/server.pid
bin/rails s -p $PORT -b 0.0.0.0 &
tail -f /dev/null
