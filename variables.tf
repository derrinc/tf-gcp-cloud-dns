variable "project_id" {
  type        = string
  description = "The GCP Project ID where the DNS zone will be created"
}

variable "zone_name" {
  type        = string
  description = "The name of the DNS zone resource in GCP (e.g., 'holomuatech-online')"
}

variable "domain_name" {
  type        = string
  description = "The DNS domain name (e.g., 'holomuatech.online')"
}

variable "description" {
  type        = string
  description = "A description of the DNS zone"
  default     = "Managed by Terraform"
}

variable "visibility" {
  type        = string
  description = "The zone visibility (public or private)"
  default     = "public"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility must be either 'public' or 'private'."
  }
}

variable "vpc_network_id" {
  type        = string
  description = "The VPC network ID for private DNS zones"
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to the DNS zone"
  default     = {}
} 