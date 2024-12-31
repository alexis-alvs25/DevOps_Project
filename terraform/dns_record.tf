# DNS record for "cloud" (Nextcloud)

resource "ovh_domain_zone_record" "cloud_ipv6" {
  zone       = var.dns_zone
  fieldtype  = "AAAA"
  subdomain  = "cloud.alalves"
  target     = substr(openstack_compute_instance_v2.basic.access_ip_v6, 1, length(openstack_compute_instance_v2.basic.access_ip_v6) - 2)    # Remove the [] from the IP address to make it a valid IPv6 address
  ttl        = 60
  depends_on = [openstack_compute_instance_v2.basic]
}

# DNS record for "blog" (Wordpress)

resource "ovh_domain_zone_record" "blog_ipv6" {
  zone       = var.dns_zone
  fieldtype  = "AAAA"
  subdomain  = "blog.alalves"
  target     = substr(openstack_compute_instance_v2.basic.access_ip_v6, 1, length(openstack_compute_instance_v2.basic.access_ip_v6) - 2)
  ttl        = 60
  depends_on = [openstack_compute_instance_v2.basic]
}

# DNS record for "projet" (Go_app)

resource "ovh_domain_zone_record" "projet_ipv6" {
  zone       = var.dns_zone
  fieldtype  = "AAAA"
  subdomain  = "projet.alalves"
  target     = substr(openstack_compute_instance_v2.basic.access_ip_v6, 1, length(openstack_compute_instance_v2.basic.access_ip_v6) - 2)
  ttl        = 60
  depends_on = [openstack_compute_instance_v2.basic]
}
