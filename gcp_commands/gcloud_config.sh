#!/bin/bash

gcloud init --skip-diagnostics

PROJECT_ID=$(gcloud projects list | awk '{if(NR==2){print $1}}')
PROJECT_NUMBER=$(gcloud projects list | awk '{if(NR==2){print $3}}')

  # Grant the Cloud Run Admin role to the Cloud Build service account
gcloud projects add-iam-policy-binding My First Project \
  --member "serviceAccount:capable-range-333203@cloudbuild.gserviceaccount.com" \
  --role "roles/run.admin"
  

# Grant the IAM Service Account User role to the Cloud Build service account on the Cloud Run runtime service account
gcloud iam service-accounts add-iam-policy-binding \
  $PROJECT_NUMBER-compute@developer.gserviceaccount.com \
  --member="serviceAccount:capable-range-333203@cloudbuild.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser"
  
