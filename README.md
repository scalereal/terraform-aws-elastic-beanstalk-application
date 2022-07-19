# terraform-aws-elastic-beanstalk-application
![CI](https://github.com/scalereal/terraform-aws-elastic-beanstalk-application/workflows/CI/badge.svg)


Terraform Module for AWS elastic beanstalk application creation.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elastic_beanstalk_application.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appversion_delete_source_from_s3"></a> [appversion\_delete\_source\_from\_s3](#input\_appversion\_delete\_source\_from\_s3) | (Optional) Set to true to delete a version's source bundle from S3 when the application version is deleted. | `bool` | `false` | no |
| <a name="input_appversion_max_age_in_days"></a> [appversion\_max\_age\_in\_days](#input\_appversion\_max\_age\_in\_days) | (Optional) The number of days to retain an application version. Should be used only if appversion\_max\_count is not set. | `string` | `""` | no |
| <a name="input_appversion_max_count"></a> [appversion\_max\_count](#input\_appversion\_max\_count) | (Optional) The maximum number of application versions to retain. | `string` | `""`| no |
| <a name="input_appversion_service_role_arn"></a> [appversion\_service\_role\_arn](#input\_appversion\_service\_role\_arn) | (Required if appversion configuration is to be set) The ARNof an IAM service role under which the application version is deleted. Elastic Beanstalk must have permission to assume this role. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Short description of the application | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the application, must be unique within your account | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Application tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_delete_source_from_s3"></a> [delete\_source\_from\_s3](#output\_delete\_source\_from\_s3) | Elastic beanstalk application appversion delete source from s3 |
| <a name="output_description"></a> [description](#output\_description) | Elastic beanstalk application description |
| <a name="output_max_age_in_days"></a> [max\_age\_in\_days](#output\_max\_age\_in\_days) | Elastic beanstalk application appversion max age in days |
| <a name="output_max_count"></a> [max\_count](#output\_max\_count) | Elastic beanstalk application appversion max count |
| <a name="output_name"></a> [name](#output\_name) | Elastic beanstalk application name |
| <a name="output_service_role"></a> [service\_role](#output\_service\_role) | Elastic beanstalk application appversion service role |
| <a name="output_tags"></a> [tags](#output\_tags) | Elastic beanstalk application tags |

