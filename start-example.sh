#!/usr/bin/bash
URL="https://{YOUR_HOSTNAME}.ngrok.io"
SECRET="{YOUR_RANDOM_STRING}"
TOKEN="{YOUR_TOKEN}"
USERNAME="samgabrail"
REPO_ALLOWLIST="github.com/samgabrail/env0-atlantis-gcp" #GitHub example: REPO_ALLOWLIST="github.com/runatlantis/atlantis"
# Any environment variables required for auth
export GOOGLE_APPLICATION_CREDENTIALS="path-to-json-file"

atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST"