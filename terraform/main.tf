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

variable "version_label" {
  type = string
}

resource "aws_elastic_beanstalk_application_version" "my_app_version" {
  application   = var.application_name
  version_label = var.version_label
  description   = "My Elastic Beanstalk Application Version"
  bucket        = var.s3_bucket
  key           = var.s3_key
}
