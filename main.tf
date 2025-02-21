# Create the DNS Zone
resource "google_dns_managed_zone" "dns_zone" {
  name        = var.zone_name
  dns_name    = "${var.domain_name}."
  description = var.description
  
  visibility = var.visibility

  dynamic "private_visibility_config" {
    for_each = var.visibility == "private" ? [1] : []
    content {
      networks {
        network_url = var.vpc_network_id
      }
    }
  }

  labels = var.labels
} 