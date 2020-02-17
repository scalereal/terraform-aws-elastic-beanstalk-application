locals {
  tags = merge({ role = "eb-app" }, var.tags)
  common_options = {
    service_role          = var.appversion_service_role_arn
    delete_source_from_s3 = var.appversion_delete_source_from_s3
  }
  options = [var.appversion_max_count != "" && var.appversion_max_age_in_days == "" && var.appversion_service_role_arn != "" ? merge({ max_count = var.appversion_max_count }, local.common_options) : merge({ max_age_in_days = var.appversion_max_age_in_days }, local.common_options)]
}

resource "aws_elastic_beanstalk_application" "this" {
  name        = var.name
  description = var.description
  tags        = local.tags

  dynamic "appversion_lifecycle" {
    for_each = local.options
    content {
      service_role          = var.appversion_service_role_arn
      max_age_in_days       = lookup(appversion_lifecycle.value, "max_age_in_days", null)
      delete_source_from_s3 = lookup(appversion_lifecycle.value, "delete_source_from_s3", null)
      max_count             = lookup(appversion_lifecycle.value, "max_count", null)
    }
  }
}
