# This scripts recieves data to clone, build an deploy a certain application.

REPO=$1
URL=$2
NAME=$3

git clone $REPO.git
docker build -t $NAME $REPO
docker run -p 80:80 -d $NAME
