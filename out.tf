output "name" {
  value = aws_elastic_beanstalk_application.this.name
  description = "Elastic beanstalk application name"
}

output "description" {
  value = aws_elastic_beanstalk_application.this.description
  description = "Elastic beanstalk application description"
}

output "tags" {
  value = aws_elastic_beanstalk_application.this.tags
  description = "Elastic beanstalk application tags"
}

output "service_role" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.service_role
  description = "Elastic beanstalk application appversion service role"
}

output "max_age_in_days" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.max_age_in_days
  description = "Elastic beanstalk application appversion max age in days"
}

output "delete_source_from_s3" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.delete_source_from_s3
  description = "Elastic beanstalk application appversion delete source from s3"
}

output "max_count" {
  value = aws_elastic_beanstalk_application.this.appversion_lifecycle.0.max_count
  description = "Elastic beanstalk application appversion max count"
}
