# traefik

traefik (reverse proxy) setup for development

## start

    $ docker-compose up -d traefik

Open the traefik dashboard at [http://localhost:8080](http://localhost:8080) to see if everything works.

## test service (whoami)

    $ docker-compose up -d whoami

Go to [http://whoami.docker.localhost](http://whoami.docker.localhost) to see if http connection works.

Go to [https://whoami.docker.localhost](https://whoami.docker.localhost) to see if secure connection works. Tell your browser to accept the self-signed certificate. You will have to repeat this step whenever you restart your container.

## production setup

the production setup is located `prod`. Make sure not to expose any secrets to the git repository!