# Traefik

Traefik (reverse proxy) for Mind-Hochschul-Netzwerk

## Dev setup

Copy [.env.sample](./.env.sample) and remove `.sample` suffix. Change to your needs.

```bash
make dev
```

Go to [http://traefik.docker.localhost](http://traefik.docker.localhost) to see if http connection works.

You will have to repeat this step whenever you restart your container.

Go to [https://whoami.docker.localhost](https://whoami.docker.localhost) to see if secure connection works. Tell your browser to accept the self-signed certificate.

## Production setup

Copy [.env.sample](./.env.sample) and remove `.sample` suffix. Change to your needs.

Copy [traefik-static.prod.yml.sample](./conf/traefik-static.prod.yml.sample) and remove `.sample` suffix. Change to your needs.

Create a `dnschallenge.env` with the required environment keys for your DNS challenge provider.
See: [traefik docs](https://doc.traefik.io/traefik/https/acme/#dnschallenge)

```bash
make prod
```

Make sure not to expose any secrets to the git repository!
