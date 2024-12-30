resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = data.openstack_images_image_v2.debian.id
  flavor_name     = "v2.m1024.d10" 
  security_groups = ["default", "group_one"]
  
  user_data = file("./config.yaml")
  config_drive = "true"

  network {
    name = "public"
  }
}

data "openstack_images_image_v2" "debian"{
    name="Official-debian-12"
}

resource "openstack_networking_secgroup_v2" "secgroup1" {
  name        = "group_one"
  description = "My neutron security group"
}

# SSH rule for IPv6
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "::/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup1.id
}

# Rule for Nextcloud and Wordpress (port 8080 and 8081) for IPv6
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_http_apps" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8081
  remote_ip_prefix  = "::/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup1.id
}

output "vm_ipv6" {
  value = openstack_compute_instance_v2.basic.access_ip_v6
}