# Example to run a NodeJS app with Docker

This is my fork with some notes and updates from Erick Wendel repository used as example on the [Maratona Kubernetes](https://www.youtube.com/playlist?list=PLB1hpnUGshULerdlzMknMLrHI810xIBJv) course.

---

### Requirements

- Node.js v10+
- MongoDB running on local instance

### Environment Variables

- PORT: 3000
- MONGO_URL: localhost:27017

---

### Running with Docker

Commands:

```bash
$ docker build -t api-herois .

$ docker run -p 3000:3000 --link mongodb:mongodb -e MONGO_URL=mongodb api-herois

$ docker run -d --name mongodb mongo:3.5
```

Commands explanation:

- docker build -t <NEW_IMAGE_NAME> <PATH_TO_THE_APP_DIRECTORY>
- docker run -p <VIRTUAL_MACHINE_PORT>:<CONTAINER_PORT> --link <LINKED_IMAGE_NAME>:<NEW_SLUG_IMAGE_NAME_ON_CONTAINER> -e <ENV_VARS> <IMAGE_NAME>
- docker run -d --name <NEW_SLUG_IMAGE_NAME> <IMAGE_NAME>

<br />

### Running with docker compose

This command will run accord whit the `docker-compose.yml` file

```bash
$ docker-compose up
```

## <br />

### Running the base app

- Install dependencies - `npm i`
- Build typescript - `npm run build`
- Run project - `npm start`
- Go to swagger page - `localhost:3000/`

### Development with Watch Compiler

- Run once - `npm run dev`
- Run and watch files - `npm run dev:watch`
