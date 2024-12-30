variable "ovh_application_key" {
  description = "Application key for OVH API"
  type        = string
}

variable "ovh_application_secret" {
  description = "Application secret for OVH API"
  type        = string
}

variable "ovh_consumer_key" {
  description = "Consumer key for OVH API"
  type        = string
}

variable "ovh_endpoint" {
  description = "Endpoint for OVH API"
  type        = string
  default     = "ovh-eu"
}

variable "dns_zone" {
  description = "The DNS zone to manage"
  type        = string
}