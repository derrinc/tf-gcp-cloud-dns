output "zone_id" {
  description = "The ID of the DNS zone"
  value       = google_dns_managed_zone.dns_zone.id
}

output "name_servers" {
  description = "The list of nameservers that will serve the zone"
  value       = google_dns_managed_zone.dns_zone.name_servers
}

output "zone_name" {
  description = "The name of the DNS zone"
  value       = google_dns_managed_zone.dns_zone.name
}

output "dns_name" {
  description = "The DNS name of the zone"
  value       = google_dns_managed_zone.dns_zone.dns_name
} 