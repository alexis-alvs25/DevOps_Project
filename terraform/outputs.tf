output "dns_records" {
  value = {
    cloud_url  = "http://${ovh_domain_zone_record.cloud_ipv6.subdomain}.${ovh_domain_zone_record.cloud_ipv6.zone}:8080"
    blog_url   = "http://${ovh_domain_zone_record.blog_ipv6.subdomain}.${ovh_domain_zone_record.blog_ipv6.zone}:8081"
    projet_url = "http://${ovh_domain_zone_record.projet_ipv6.subdomain}.${ovh_domain_zone_record.projet_ipv6.zone}:8000"

    cloud_ipv6  = ovh_domain_zone_record.cloud_ipv6.target
    blog_ipv6   = ovh_domain_zone_record.blog_ipv6.target
    projet_ipv6 = ovh_domain_zone_record.projet_ipv6.target
  }
}