all: backend frontend admin

all-podman: backend-podman frontend-podman admin-podman

down: down-backend down-frontend down-admin

down-podman: down-backend-podman down-frontend-podman down-admin-podman

aio:
	docker-compose --profile default up -d

aio-podman:
	podman compose --profile default up -d

# Gera certificados SSL autoassinados no modo interativo
ssl-certificates:
	mkdir -p certs
	openssl req -x509 -newkey rsa:4096 -keyout ./certs/nginx.key -out ./certs/nginx.crt -sha256 -days 3650 -nodes -subj "/C=XX/ST=PR/L=Curitiba/O=Bradseg/OU=Digital/CN=BSPG"

backend:
	docker-compose --profile backend up -d

frontend:
	docker-compose --profile app up -d

admin:
	docker-compose --profile admin up -d

backend-podman:
	podman compose --profile backend up -d

frontend-podman:
	podman compose --profile app up -d

admin-podman:
	podman compose --profile admin up -d

down-backend:
	docker-compose --profile backend down

down-frontend:
	docker-compose --profile app down

down-admin:
	docker-compose --profile admin down

down-backend-podman:
	podman compose --profile backend down

down-frontend-podman:
	podman compose --profile app down

down-admin-podman:
	podman compose --profile admin down
