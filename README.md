Webhook Listener API
====================

This api will listen to the webhook send by gogs.

## Version 0.0.1
 - The API recieves a post from the webhook, it reads all the json and calls the runner.sh that will destroy (in case), build and deploy our new application.
 - This API requires node 0.8.0 to run.

## How to deploy?
We need to set the webhook of our repository on GOGS. All you need to do is add the payload URL where this app is running and set the content type as application/json. And with this you'll be able to deploy any application on docker.

## Next steps
 - The application does not stop nor remove the container currently running. You'll have to stop and delete that container if you want to update.
 - The API does not check if the port is currently in use, so you'll need to set the port that you want to use. The host will use the same port as the container.
 - You'll need to create a Dockerfile in your repository in order to be deployed. You can see the Dockerfile included with this repository.
 - The runner.sh script needs to be set on the file that tne index.js file says. You can change this if you want.

## Dockerfile Example
```
# use our prepared Raspberry Pi compatible Docker base image with Node.js
# FROM hypriot/rpi-node:0.12.0
FROM hypriot/rpi-iojs:latest

# make the src folder available in the docker image
ADD src/ /src
WORKDIR /src

# install the dependencies from the package.json file
RUN npm install

# make port 5000 available outside of the image
EXPOSE 5000

# start node with the index.js file of our hello-world application
CMD ["node", "index.js"]

```

## Webhook JSON Example

```javascript
 {
     "secret": "",
     "ref": "refs/heads/master",
     "commits": [
         {
             "id": "5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb",
             "message": "hi\n",
             "url": "http://localhost:3000/dio/hello-world/commit/5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb",
             "author": {
                 "name": "Dio",
                 "email": "dio@swaggin.xyz",
                 "username": "dio"
             }
         }
     ],
     "repository": {
         "id": 1,
         "name": "hello-world",
         "url": "http://localhost:3000/dio/hello-world",
         "description": "",
         "website": "",
         "watchers": 1,
         "owner": {
             "name": "Dio",
             "email": "dio@swaggin.xyz",
             "username": "dio"
         },
         "private": false
     },
     "pusher": {
         "name": "Dio",
         "email": "dio@swaggin.xyz",
         "username": "dio"
     },
     "before": "f22f45d79a2ff050f0250a7df41f4944e6591853",
     "after": "5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb",
     "compare_url": "http://localhost:3000/dio/hello-world/compare/f22f45d79a2ff050f0250a7df41f4944e6591853...5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb"
 }
```
####### Created by @lordzero0000 under the WTFPL License.
