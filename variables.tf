# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "role" {
  description = "The IAM role to attach to the policy."
}

variable "output_bucket" {
  description = "Name of a bucket where the SSM agent will be allowed to write command outputs."
  default     = ""
}
