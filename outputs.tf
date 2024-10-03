# modules/cloud_dns/outputs.tf

output "managed_zone_name" {
  description = "The name of the managed DNS zone."
  value       = google_dns_managed_zone.managed_zone.name
}

output "cname_records" {
  description = "Details of the created CNAME records."
  value       = {
    for key, record in google_dns_record_set.cname_records : key => {
      name = record.name
      type = record.type
      ttl  = record.ttl
      data = record.rrdatas
    }
  }
}

