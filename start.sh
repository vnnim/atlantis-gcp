#!/usr/bin/bash
URL="https://a614-34-170-219-36.ngrok-free.app"
SECRET="hZ19pPldbnWzmBsT"
TOKEN="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"
USERNAME="vnnim"
REPO_ALLOWLIST="github.com/vnnim/atlantis-gcp" #GitHub example: REPO_ALLOWLIST="github.com/runatlantis/atlantis"
# Any environment variables required for auth
export GOOGLE_APPLICATION_CREDENTIALS="./gcp-secret-key.json"

atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST"
