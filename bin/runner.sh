# This scripts recieves data to clone, build an deploy a certain application.

REPO=$1
URL=$2

cd /opt/cd-stuff/
git clone $URL.git
cd /opt/cd-stuff/$REPO
docker build -t $REPO .
docker run -p 80:80 -d $REPO
