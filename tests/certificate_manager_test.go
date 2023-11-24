package test

import (
  "testing"

  "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformWasabiS3Bucket(t *testing.T) {
  terraformOptions := &terraform.Options{
    TerraformDir: "./fixtures",
  }

  defer terraform.Destroy(t, terraformOptions)

  terraform.InitAndApply(t, terraformOptions)

}
