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
fi
