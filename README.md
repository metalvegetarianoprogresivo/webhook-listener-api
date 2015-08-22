webhook-listener-api
====================

This api will listen to the webhook send by gogs.

# Version 0.0.1
 - the api recieves a post from the webhook, it reads all the json and calls the runner.sh that will destroy (in case), build and deploy our new application.

# Webhook JSON Example

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
                 "email": "joe2010xtmf@163.com",
                 "username": "dio"
             }
         }
     ],
     "repository": {
         "id": 1,
         "name": "macaron",
         "url": "http://localhost:3000/dio/hello-world",
         "description": "",
         "website": "",
         "watchers": 1,
         "owner": {
             "name": "Dio",
             "email": "joe2010xtmf@163.com",
             "username": "dio"
         },
         "private": false
     },
     "pusher": {
         "name": "Dio",
         "email": "joe2010xtmf@163.com",
         "username": "dio"
     },
     "before": "f22f45d79a2ff050f0250a7df41f4944e6591853",
     "after": "5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb",
     "compare_url": "http://localhost:3000/dio/hello-world/compare/f22f45d79a2ff050f0250a7df41f4944e6591853...5f69e7cedd45fcce5ea8f3116e9e20f15e90dafb"
 }
```
