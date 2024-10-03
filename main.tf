# modules/cloud_dns/main.tf

resource "google_dns_managed_zone" "managed_zone" {
  name        = var.zone_name
  dns_name    = var.zone_dns_name
  visibility  = var.zone_visibility

  # Only required for private zones
  dynamic "networks" {
    for_each = var.zone_visibility == "private" ? var.networks : []
    content {
      network_url = networks.value
    }
  }

  description = var.zone_description
}

resource "google_dns_record_set" "cname_records" {
  for_each     = var.cname_records
  name         = "${each.key}.${var.zone_dns_name}."
  type         = "CNAME"
  ttl          = var.record_ttl
  managed_zone = google_dns_managed_zone.managed_zone.name
  rrdatas      = [each.value]
}

