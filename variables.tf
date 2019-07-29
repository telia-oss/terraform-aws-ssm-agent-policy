# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "role" {
  description = "The IAM role to attach to the policy."
  type        = string
}

variable "output_bucket" {
  description = "Name of a bucket where the SSM agent will be allowed to write command outputs."
  type        = string
  default     = ""
}

