# hareclip-imaginary

Imaginary image resizing deployment for Hareclip


## Deploy on GCP

Build docker container:

```
docker build . -t hareclip-imaginary:latest

gcloud auth configure-docker
docker tag hareclip-imaginary:latest gcr.io/hareclip/hareclip-imaginary:latest
docker push gcr.io/hareclip/hareclip-imaginary:latest
```

Create a service account for Terraform with `Owner` role.

Create a JSON key for your service account. Save the JSON file into the repo as
`keys.json`.

Deploy service:

```
terraform init
terraform apply
```