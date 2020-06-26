#!/bin/sh

export PATH=$PATH:/root/google-cloud-sdk/bin

if [[ ! -z "${GOOGLE_APPLICATION_CREDENTIALS_JSON}" ]]; then
  echo $GOOGLE_APPLICATION_CREDENTIALS_JSON > /root/google-credential.json
  gcloud auth activate-service-account --key-file /root/google-credential.json
fi

# for db in $(echo $COCKROACH_DATABASE | tr "," "\n")
# do
#     cockroach dump $db | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX-$db.sql.gz
# done

# if [[ -z "${COCKROACH_DATABASE}" ]]; then
#   cockroach dump --dump-all | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
# else
  cockroach dump $COCKROACH_DATABASE | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
# fi
