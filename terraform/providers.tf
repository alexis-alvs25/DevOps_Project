# Determine the version of the OpenStack provider to use
terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "1.4.0"
    }
  }
  required_version = ">= 1.0.0"
}


# We ask OpenTofu to use the provider downloaded just now
provider "openstack" {
  cloud = "openstack"
}


# OVH Configuration
provider "ovh" {
  endpoint           = var.ovh_endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}
