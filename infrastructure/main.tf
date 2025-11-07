terraform {
  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.20"
    }
  }
  required_version = ">= 1.3.0"
}

provider "fly" {}

resource "fly_app" "backend" {
  name = var.app_name
  org  = "personal"
}