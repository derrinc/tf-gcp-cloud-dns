# modules/cloud_dns/variables.tf

variable "zone_name" {
  type        = string
  description = "The name of the DNS managed zone."
}

variable "zone_dns_name" {
  type        = string
  description = "The DNS name of the managed zone, e.g., 'example.internal.'. Must end with a dot."
}

variable "zone_visibility" {
  type        = string
  description = "The visibility of the DNS managed zone. Options: 'public', 'private'."
  default     = "private"
}

variable "networks" {
  type        = list(string)
  description = "List of VPC network URLs to associate with the private managed zone. Required if zone_visibility is 'private'."
  default     = []
}

variable "zone_description" {
  type        = string
  description = "A description for the DNS managed zone."
  default     = "Managed by Terraform"
}

variable "cname_records" {
  type        = map(string)
  description = "A map of subdomain to target hostname for CNAME records. Example: { 'dev' = 'nginx-hello-world-px3dwr6caa-uw.a.run.app.' }"
  default     = {}
}

variable "record_ttl" {
  type        = number
  description = "The TTL for DNS records in seconds."
  default     = 300
}

