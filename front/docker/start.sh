yarn config set cache-folder /front/yarn-cache
yarn install
if [ "$NODE_ENV" = "development" ]
then
  yarn dev &
  /bin/bash && tail -f /dev/null
else
  yarn build
  yarn start && tail -f /dev/null
fi
