VAULT_ADDR=https://vault.edu.forestier.re/v1

# Login to Vault using token
VAULT_TOKEN=$(curl -s -X POST -k --data "{\"token\":\"$CI_JOB_TOKEN\"}" "$VAULT_ADDR/auth/gitlab/ci" | python3 jq.py "auth/client_token")


# Retrieve Docker Registry secret
SECRET_DOCKER_REGISTRY=$(curl -s -X GET -k --header "X-Vault-Token: $VAULT_TOKEN" "$VAULT_ADDR/shared/data/docker_registry")

# Here, export value Y of our secret to Y in our environment
export DOCKER_REGISTRY_URL=$(echo "$SECRET_DOCKER_REGISTRY" | python3 jq.py "data/data/URL")
export DOCKER_REGISTRY_USER=$(echo "$SECRET_DOCKER_REGISTRY" | python3 jq.py "data/data/USERNAME")
export DOCKER_REGISTRY_PASSWORD=$(echo "$SECRET_DOCKER_REGISTRY" | python3 jq.py "data/data/PASSWORD")


# Retrieve my secrets
SECRET_HOME=$(curl -s -X GET -k --header "X-Vault-Token: $VAULT_TOKEN" "$VAULT_ADDR/home/data/alalves")

export MARIADB_ROOT_PASSWORD=$(echo "$SECRET_HOME" | python3 jq.py "data/data/MARIADB_ROOT_PASSWORD")
export NEXTCLOUD_USER=$(echo "$SECRET_HOME" | python3 jq.py "data/data/NEXTCLOUD_USER")
export NEXTCLOUD_PASSWORD=$(echo "$SECRET_HOME" | python3 jq.py "data/data/NEXTCLOUD_PASSWORD")
export WORDPRESS_USER=$(echo "$SECRET_HOME" | python3 jq.py "data/data/WORDPRESS_USER")
export WORDPRESS_PASSWORD=$(echo "$SECRET_HOME" | python3 jq.py "data/data/WORDPRESS_PASSWORD")
