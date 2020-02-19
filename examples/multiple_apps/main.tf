provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

module "elasticbeanstalk_application_with_appversion_max_count" {
  source                           = "../../"
  name                             = "${var.name}-application-with-appversion-max-count"
  description                      = "${var.description} with max count"
  tags                             = var.tags
  appversion_delete_source_from_s3 = var.appversion_delete_source_from_s3
  appversion_max_count             = var.appversion_max_count
  appversion_service_role_arn      = aws_iam_role.this.arn
}

module "elasticbeanstalk_application_with_appversion_max_age_in_days" {
  source                           = "../../"
  name                             = "${var.name}-application-with-appversion-max-age-in-days"
  description                      = "${var.description} with max age in days"
  tags                             = var.tags
  appversion_delete_source_from_s3 = var.appversion_delete_source_from_s3
  appversion_max_age_in_days       = var.appversion_max_age_in_days
  appversion_service_role_arn      = aws_iam_role.this.arn
}
