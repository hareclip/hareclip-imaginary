terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.42.1"
    }
  }
}

provider "google" {
  credentials = file("keys.json")

  project = "hareclip"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_cloud_run_service" "default" {
  name     = "hareclip-imaginary"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/hareclip/hareclip-imaginary:latest"
      }
      container_concurrency = 1
      timeout_seconds       = 120
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
