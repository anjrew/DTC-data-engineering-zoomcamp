export GOOGLE_APPLICATION_CREDENTIALS="$PWD/secrets/gc-keys.json"
export $(cat $PWD/secrets/.env | xargs)


# Refresh token/session, and verify authentication
gcloud auth application-default login

y | conda create -n DTC_DE_ZOOM_CAMP python=3.9.15
conda activate DTC_DE_ZOOM_CAMP
pip install -r requirements.txt