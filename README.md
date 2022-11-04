# hareclip-imaginary

Imaginary image resizing deployment for Hareclip


## Deploy on GCP

```
docker build . -t hareclip-imaginary:latest

gcloud auth configure-docker
docker tag hareclip-imaginary:latest gcr.io/<PROJECT ID>/hareclip-imaginary:latest

gcloud run deploy hareclip-imaginary \
  --image="gcr.io/<PROJECT ID>/hareclip-imaginary:latest" \
  --region <REGION> \
  --allow-unauthenticated
```