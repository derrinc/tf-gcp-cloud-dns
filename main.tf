# modules/cloud_dns/main.tf

resource "google_dns_managed_zone" "managed_zone" {
  name        = var.zone_name
  dns_name    = "${var.zone_dns_name}."
  visibility  = var.zone_visibility

  # Conditionally include networks block for private zones only
  dynamic "private_visibility_config" {
    for_each = var.zone_visibility == "private" ? [1] : []
    content {
      networks {
        network_url = var.networks[0]
      }
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

