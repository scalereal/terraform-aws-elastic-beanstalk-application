# terraform-aws-elastic-beanstalk-application
![CI](https://github.com/scalereal/terraform-aws-elastic-beanstalk-application/workflows/CI/badge.svg)


Terraform Module for AWS elastic beanstalk application creation.
## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| appversion\_delete\_source\_from\_s3 | (Optional) Set to true to delete a version's source bundle from S3 when the application version is deleted. | `bool` | `false` | no |
| appversion\_max\_age\_in\_days | (Optional) The number of days to retain an application version. Should be used only if appversion\_max\_count is not set. | `string` | `""` | no |
| appversion\_max\_count | (Optional) The maximum number of application versions to retain. | `string` | `""` | no |
| appversion\_service\_role\_arn | (Required if appversion configuration is to be set) The ARN of an IAM service role under which the application version is deleted. Elastic Beanstalk must have permission to assume this role. | `string` | `""` | no |
| description | (Optional) Short description of the application | `string` | `""` | no |
| name | (Required) The name of the application, must be unique within your account | `string` | n/a | yes |
| tags | (Optional) Application tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| delete\_source\_from\_s3 | Elastic beanstalk application appversion delete source from s3 |
| description | Elastic beanstalk application description |
| max\_age\_in\_days | Elastic beanstalk application appversion max age in days |
| max\_count | Elastic beanstalk application appversion max count |
| name | Elastic beanstalk application name |
| service\_role | Elastic beanstalk application appversion service role |
| tags | Elastic beanstalk application tags |

