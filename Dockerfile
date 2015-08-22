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
