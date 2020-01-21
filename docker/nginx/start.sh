if [ "$NODE_ENV" = "development" ]
then
  envsubst '$$RAILS_PORT $$NODE_PORT $$PORT'< /nginx/app.conf.development > /etc/nginx/conf.d/app.conf
else
  envsubst '$$RAILS_PORT $$NODE_PORT $$PORT'< /nginx/app.conf.production > /etc/nginx/conf.d/app.conf
fi
exec nginx -g 'daemon off;'
