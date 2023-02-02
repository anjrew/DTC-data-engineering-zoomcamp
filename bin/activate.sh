export GOOGLE_APPLICATION_CREDENTIALS="$PWD/secrets/gc-keys.json"
export $(cat $PWD/secrets/.env | xargs)


# Refresh token/session, and verify authentication
gcloud auth application-default login