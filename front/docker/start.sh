if [ "$NODE_ENV" = "development" ]
then
  yarn dev &
  /bin/bash && tail -f /dev/null
else
  rm -f dist/buildend 
  yarn build && touch dist/buildend
fi
