# share-your-code

:rocket: Share your static project quickly with 1 command line. :rocket:

![Example](Example.gif)

## Prerequisite

### Install Docker

- On Windoows: https://docs.docker.com/docker-for-windows/install/

- On Mac: https://docs.docker.com/docker-for-mac/install/

- On Ubuntu: https://docs.docker.com/engine/install/ubuntu/ 

### Download and install ngrok

Please follow instructions here : https://ngrok.com/download

**What is ngrok?**

Ngrok exposes local servers behind NATs and firewalls to the public internet over secure tunnels.

Instantly create a public HTTPS url for a website running locally on your development machine.

Ngrok offloads TLS so you don't have to worry about your configuration.

## Installation

```(yaml)

# Clone the repo

git clone git@github.com:francoislamiedepain/share-your-code.git

# change the working directory to share-your-code
$ cd share-your-code
```

## Usage

Simply run command :

```(yaml)
username@fha share-your-code (main) $ . ./share-your-code.sh
```

## Share your own content

Simply modify/change current .html, .css , .js files for your own needs.

## How it's work

share-your-code.sh will simply build a new docker container based on a Dockerfile

```(Dockerfile)
FROM nginx:alpine
COPY ./src /usr/share/nginx/html
```

**FROM** : creates a layer from the nginx:alpine Docker Image.

**COPY** : adds files from `/src` to nginx `/usr/share/nginx/html` directory.

You just need to change static files in  `/src` to run your own code.

share-your-code.sh will delete previous container if exists and run new container based on provided informations.

Final step will run

```(Dockerfile)
./ngrok http http://localhost
```

Then your application can be access from anywhere.  

Traffic is relayed through to the ngrok process running on your machine and then on to the local address you specified. (here `localhost:80`) .

Now, you can demo websites without deploying.

## References

- Static files: https://codepen.io/Tbgse/pen/dYaJyJ
- Ngrok: https://ngrok.com/
