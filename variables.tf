variable "account_id" {
  default = ""
}

variable "additional_tags" {
  type        = "map"
  default     = {}
  description = ""
}

variable "namespace" {
  type        = "string"
  description = ""
}

variable "prefix" {
  type        = "string"
  description = ""
}

variable "namespace_tag_key" {
  type        = "string"
  default     = "namespace"
  description = ""
}

variable "prefix_tag_key" {
  type        = "string"
  default     = "environment"
  description = ""
}

variable "cidr_restrictions" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = ""
}

locals {
  prefix      = "${lower(var.prefix)}"
  policy_path = "/${local.prefix}/${var.namespace}/"

  required_tags = "${map(
    var.prefix_tag_key, local.prefix
    var.namespace_tag_key, var.namespace
  )}"

  tags = "${merge(var.additional_tags, local.required_tags)}"
}
