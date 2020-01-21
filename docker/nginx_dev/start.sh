envsubst '$$RAILS_PORT $$NODE_PORT $$WEB_PORT'< /nginx/app.conf > /etc/nginx/conf.d/app.conf
cp /nginx/app.corf.confpart /etc/nginx/conf.d/app.corf.confpart
exec nginx -g 'daemon off;'
