VAULT_ADDR=https://vault.edu.forestier.re/v1

# Login to Vault using token
VAULT_TOKEN=$(curl -s -X POST -k --data "{\"token\":\"$CI_JOB_TOKEN\"}" "$VAULT_ADDR/auth/gitlab/ci" | python3 jq.py "auth/client_token")

# Retrieve a Vault secret and store it in a variable.
SECRET=$(curl -s -X GET -k --header "X-Vault-Token: $VAULT_TOKEN" "$VAULT_ADDR/shared/data/docker_registry")

# Here, export value Y of our secret to Y in our environment
export DOCKER_REGISTRY_URL=$(echo "$SECRET" | python3 jq.py "data/data/URL")
export DOCKER_REGISTRY_USER=$(echo "$SECRET" | python3 jq.py "data/data/USERNAME")
export DOCKER_REGISTRY_PASSWORD=$(echo "$SECRET" | python3 jq.py "data/data/PASSWORD")