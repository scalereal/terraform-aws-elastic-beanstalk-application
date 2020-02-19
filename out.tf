output "name" {
  value = aws_elastic_beanstalk_application.this.name
}

output "description" {
  value = aws_elastic_beanstalk_application.this.description
}

output "tags" {
  value = aws_elastic_beanstalk_application.this.tags
}

output "service_role" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.service_role
}

output "max_age_in_days" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.max_age_in_days
}

output "delete_source_from_s3" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.delete_source_from_s3
}

output "max_count" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.max_count
}
