# ---------------------------
# Terraform Configuration
# ---------------------------
terraform {
  required_version = ">= 1.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# ---------------------------
# Provider
# ---------------------------
provider "aws" {
  region = "ap-northeast-1"
}

# ---------------------------
# Variables
# ---------------------------
variable "project" {
  type = string
}

variable "env" {
  type = string
}


