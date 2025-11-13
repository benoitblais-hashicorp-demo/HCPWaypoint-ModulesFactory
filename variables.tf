variable "organization" {
  description = "(Required) Name of the organization."
  type        = string
  nullable    = false
}

variable "labels" {
  description = "(Optional) Labels to assign to the Waypoint template."
  type        = list(string)
  default     = ["hcp terraform", "module"]
  nullable    = false
}

variable "module_name" {
  description = "(Optional) Name of the module."
  type        = string
  default     = "modulesfactory"
  nullable    = false
}

variable "module_provider" {
  description = "(Optional) Name of the module provider."
  type        = string
  default     = "tfe"
  nullable    = false
}

variable "name" {
  description = "(Optional) Name of the Waypoint template."
  type        = string
  default     = "HCPTerraformModule"
  nullable    = false
}

variable "project_name" {
  description = "(Optional) Name of the Terraform Cloud/Enterprise project where the workspace created by the no-code is located."
  type        = string
  default     = "Terraform Modules Factory"
  nullable    = false
}

variable "template_description" {
  description = "(Optional) A description of the Waypoint template, along with when and why it should be used, up to 500 characters."
  type        = string
  default     = "This HCP Waypoint template provisions a HCP Terraform module. You must provide an application name (unique, up to 50 characters, letters/numbers/dashes/underscores, ends with -module), module name, and module provider."

  validation {
    condition     = var.template_description == null ? true : length(var.template_description) <= 500
    error_message = "The template description must not exceed 500 characters."
  }
}

# variable "template_readme_path" {
#   description = "(Optional) Path to the README markdown template file."
#   type        = string
#   default     = "./files/TEMPLATE_README.tpl"
# }

variable "template_summary" {
  description = "(Optional) A brief description of the Waypoint template, up to 64 characters."
  type        = string
  default     = "This template is use to provision a HCP Terraform module."

  validation {
    condition     = length(var.template_summary) <= 64
    error_message = "The template summary must not exceed 64 characters."
  }
}

variable "variables" {
  description = <<EOF
  (Optional) The variables block is a list of object that supports the following:
    name          : (Required) The name of the variable.
    variable_type : (Required) The type of the variable.
    options       : (Optional) A list of options for the variable, if applicable.
    user_editable : (Optional) Whether the variable is editable by the user creating an application.
  EOF
  type = list(object({
    name          = string
    variable_type = string
    options       = optional(list(string), null)
    user_editable = optional(bool, true)
  }))
  default = [
    {
      name          = "module_name"
      variable_type = "string"
    },
    {
      name          = "module_provider"
      variable_type = "string"
    }
  ]
}
