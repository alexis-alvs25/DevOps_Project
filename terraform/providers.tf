# Determine the version of the OpenStack provider to use
terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
  required_version = ">= 1.0.0"
}


# We ask OpenTofu to use the provider downloaded just now
provider "openstack" {
  cloud = "openstack"
}