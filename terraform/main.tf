provider "aws" {
  region = "us-east-1"
}

variable "s3_bucket" {
  type = string
}

variable "s3_key" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "application_name" {
  type = string
}

data "aws_elastic_beanstalk_environment" "my_env" {
  name = var.environment_name
}

resource "aws_elastic_beanstalk_application_version" "my_app_version" {
  application = var.application_name
  name        = "my-app-version"
  description = "My Elastic Beanstalk Application Version"
  bucket      = var.s3_bucket
  key         = var.s3_key
}

resource "aws_elastic_beanstalk_environment" "my_env_update" {
  environment_id = data.aws_elastic_beanstalk_environment.my_env.id
  application   = var.application_name
  version_label   = aws_elastic_beanstalk_application_version.my_app_version.name
  wait_for_ready_timeout = "20m"
}
