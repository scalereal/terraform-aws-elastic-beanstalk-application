variable "name" {
  type        = string
  description = "(Required) The name of the application, must be unique within your account"
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) Short description of the application"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) Application tags"
}

variable "appversion_service_role_arn" {
  type        = string
  default     = ""
  description = "(Required if appversion configuration is to be set) The ARN of an IAM service role under which the application version is deleted. Elastic Beanstalk must have permission to assume this role."
}

variable "appversion_max_count" {
  type        = string
  default     = ""
  description = "(Optional) The maximum number of application versions to retain."
}

variable "appversion_max_age_in_days" {
  type        = string
  default     = ""
  description = "(Optional) The number of days to retain an application version. Should be used only if appversion_max_count is not set."
}

variable "appversion_delete_source_from_s3" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to delete a version's source bundle from S3 when the application version is deleted."
}

