# Example to run a NodeJS app with Docker

This is my fork with some notes and updates from Erick Wendel repository used as example on the [Maratona Kubernetes](https://www.youtube.com/playlist?list=PLB1hpnUGshULerdlzMknMLrHI810xIBJv) course.

---

## Running with Docker

Commands:

```bash
$ docker build -t api-herois .

$ docker run -d --name mongodb mongo:3.5

$ docker run -p 3000:3000 --link mongodb:mongodb -e MONGO_URL=mongodb api-herois
```

Commands explanation:

- docker build -t <NEW_IMAGE_NAME> <PATH_TO_THE_APP_DIRECTORY>
- docker run -d --name <NEW_IMAGE_NICKNAME> <IMAGE_NAME>
- docker run -p <EXPOSED_PORT>:<INTERNAL_CONTAINER_PORT> --link <LINKED_IMAGE_NAME>:<NEW_IMAGE_NICKNAME_IN_CONTAINER> -e <ENV_VARS> <IMAGE_NAME>

<br />

### Running with docker compose

This command will run accord whit the `docker-compose.yml` file

```bash
$ docker-compose up
```
If you want to set environment variables in `docker-compose.yml` you can use this sintax to set the values `${<YOUR_VAR>}`:
```yml
db:
  image: "postgres:${POSTGRES_VERSION}"
  
# You can use with quotes or not

db:
  image: postgres:${POSTGRES_VERSION}
```

### Pushing images to Docker Hub

First of all, you have to login with docker cli:

```
$ docker login
> Username: <YOUR_USERNAME>
> Password: <YOUR_PASSWORD>
```

If you already have the image build you need to tag it:

```
$ docker tag <IMG_BUILD_NAME> <YOUR_USERNAME>/<REPOSITORY_IMG_NAME>:<IMAGE_VERSION(optional)>
```

If you haven't the image build, you need to create it with the tagged name:

```
$ docker build -t <YOUR_USERNAME>/<REPOSITORY_IMG_NAME>:<IMAGE_VERSION(optional)> <PATH_TO_THE_APP_DIRECTORY>
```

Finally, push to docker hub:

```
$ docker push <TAGGED_IMAGE_NAME>
```

After this you will be able to use your image as you use a NodeJS or MongoDB image for example.

---

## Running the base app

Requirements:

- Node.js v10+
- MongoDB running on local instance

Environment Variables:

- PORT: 3000
- MONGO_URL: localhost:27017

steps:

- Install dependencies - `npm i`
- Build typescript - `npm run build`
- Run project - `npm start`
- Go to swagger page - `localhost:3000/`

### Development with Watch Compiler

- Run once - `npm run dev`
- Run and watch files - `npm run dev:watch`
