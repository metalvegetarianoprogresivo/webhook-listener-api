# This scripts recieves data to clone, build an deploy a certain application.

REPO=$1
URL=$2

cd /opt/cd-stuff/
if [ -d $REPO ]; then
  chmod 777 -R $REPO
  rm -r $REPO
fi
git clone $URL.git
if [ -d $REPO ]; then
  cd /opt/cd-stuff/$REPO
  docker build -t $REPO .
  docker run -p 80:80 -d $REPO
  curl -H "Content-Type: application/json" -X POST -d '{"username":"GORT","icon_url":"http://i.imgur.com/XumCA5s.png","text":"The application has been deployed! \n http://192.168.1.93"}' https://your.slack.hooks
fi
