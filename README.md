# Traefik

Traefik (reverse proxy) for Mind-Hochschul-Netzwerk

## Dev setup

Remove ".sample" suffix from [.env](./.env) and change to your needs.

```bash
make dev
```

Go to [http://traefik.docker.localhost](http://traefik.docker.localhost) to see if http connection works.

You will have to repeat this step whenever you restart your container.

Go to [https://whoami.docker.localhost](https://whoami.docker.localhost) to see if secure connection works. Tell your browser to accept the self-signed certificate.

## Production setup

Remove ".sample" suffix from [.env](./.env) and change to your needs.

Remove the "sample" suffix from [traefik-static.prod.yml.sample](./conf/traefik-static.prod.yml.sample) and check the file.

Create a `dnschallenge.env` with the required environment keys for your DNS challenge provider.
See: [traefik docs](https://doc.traefik.io/traefik/https/acme/#dnschallenge)

```bash
make prod
```

Make sure not to expose any secrets to the git repository!
