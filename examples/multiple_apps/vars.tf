variable "aws_profile" {
  type        = string
  description = "AWS profile for running the TF scripts"
}

variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "AWS region for running the TF scripts"
}

variable "name" {
  type        = string
  description = "Name for elasticbeanstalk application"
}

variable "description" {
  type        = string
  default     = ""
  description = "Description for elasticbeanstalk application"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for elasticbeanstalk application"
}

variable "appversion_delete_source_from_s3" {
  type        = string
  default     = false
  description = "(Optional) Set to true to delete a version's source bundle from S3 when the application version is deleted."
}

variable "appversion_max_count" {
  type        = number
  default     = 1000
  description = "(Optional) The maximum number of application versions to retain."
}

variable "appversion_max_age_in_days" {
  type        = number
  default     = 90
  description = "(Optional) The number of days to retain an application version. Should be used only if appversion_max_count is not set."
}
