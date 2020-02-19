if [ "$NODE_ENV" = "development" ]
then
  envsubst '$$RAILS_PORT $$NODE_PORT $$PORT'< /nginx/app.conf.development > /etc/nginx/conf.d/default.conf
  exec nginx-debug -g 'daemon off;'
else
  envsubst '$$RAILS_PORT $$NODE_PORT $$PORT'< /nginx/app.conf.production > /etc/nginx/conf.d/default.conf
  exec nginx -g 'daemon off;'
fi
