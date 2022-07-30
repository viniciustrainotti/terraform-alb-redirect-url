variable "aws_region" {
  type        = string
  description = "AWS region on which to deploy our EKS cluster."
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use."
  default     = "viniciustrainotti"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "host" {
  type = string
  description = "Host to redirect ALB"
}