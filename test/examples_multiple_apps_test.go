package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesMultipleApps(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/multiple_apps",
		Upgrade:      true,
		VarFiles:     []string{"ci.auto.tfvars"},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	elasticbeanstalkApplicationWithAppversionMaxCountName := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_name")
	elasticbeanstalkApplicationWithAppversionMaxCountDescription := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_description")
	elasticbeanstalkApplicationWithAppversionMaxCountTags := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_tags")
	elasticbeanstalkApplicationWithAppversionMaxCountServiceRole := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_service_role")
	elasticbeanstalkApplicationWithAppversionMaxCountMaxAgeInDays := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_max_age_in_days")
	elasticbeanstalkApplicationWithAppversionMaxCountDeleteSourceFromS3 := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_delete_source_from_s3")
	elasticbeanstalkApplicationWithAppversionMaxCountMaxCount := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_count_max_count")

	assert.Equal(t, "Application-application-with-appversion-max-count", elasticbeanstalkApplicationWithAppversionMaxCountName)
	assert.Equal(t, "Description of EB Application with max count", elasticbeanstalkApplicationWithAppversionMaxCountDescription)
	assert.Equal(t, "{\n  \"Random\" = \"Tag\"\n  \"role\" = \"eb-app\"\n}", elasticbeanstalkApplicationWithAppversionMaxCountTags)
	assert.Contains(t, elasticbeanstalkApplicationWithAppversionMaxCountServiceRole, "role/eb_appversion_deletion_role")
	assert.Equal(t, "0", elasticbeanstalkApplicationWithAppversionMaxCountMaxAgeInDays)
	assert.Equal(t, "true", elasticbeanstalkApplicationWithAppversionMaxCountDeleteSourceFromS3)
	assert.Equal(t, "1000", elasticbeanstalkApplicationWithAppversionMaxCountMaxCount)

	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysName := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_name")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysDescription := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_description")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysTags := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_tags")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysServiceRole := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_service_role")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysMaxAgeInDays := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_max_age_in_days")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysDeleteSourceFromS3 := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_delete_source_from_s3")
	elasticbeanstalkApplicationWithAppversionMaxAgeInDaysMaxCount := terraform.Output(t, terraformOptions, "elasticbeanstalk_application_with_appversion_max_age_in_days_max_count")

	assert.Equal(t, "Application-application-with-appversion-max-age-in-days", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysName)
	assert.Equal(t, "Description of EB Application with max age in days", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysDescription)
	assert.Equal(t, "{\n  \"Random\" = \"Tag\"\n  \"role\" = \"eb-app\"\n}", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysTags)
	assert.Contains(t, elasticbeanstalkApplicationWithAppversionMaxAgeInDaysServiceRole,"role/eb_appversion_deletion_role")
	assert.Equal(t, "100", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysMaxAgeInDays)
	assert.Equal(t, "true", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysDeleteSourceFromS3)
	assert.Equal(t, "0", elasticbeanstalkApplicationWithAppversionMaxAgeInDaysMaxCount)
}
