provider "aws" {
  region = "us-east-1"
}

variable "s3_bucket" {
  type = string
}

variable "s3_key" {
  type = string
}

variable "application_name" {
  type = string
}

resource "aws_elastic_beanstalk_application_version" "my_app_version" {
  application = var.application_name
  name        = "my-app-version"
  description = "My Elastic Beanstalk Application Version"
  bucket      = var.s3_bucket
  key         = var.s3_key
}
