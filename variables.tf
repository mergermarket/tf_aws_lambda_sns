// Required Variables
variable "s3_bucket" {
  description = "The name of the bucket containing your uploaded Lambda deployment package."
}

variable "s3_key" {
  description = "The s3 key for your Lambda deployment package."
}

variable "function_name" {
  description = "The name of the Lambda function."
}

variable "handler" {
  description = "The function within your code that Lambda calls to begin execution."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}

variable "topic_name" {
  description = "The name for the topic used by lambda."
}

variable "subnet_ids" {
  type        = "list"
  description = "The VPC subnets in which the Lambda runs"
}

variable "security_group_ids" {
  type        = "list"
  description = "The VPC security groups assigned to the Lambda"
}

variable "lambda_env" {
  description = "Environment parameters passed to the Lambda function."
  type        = "map"
  default     = {}
}

// Optional Variables
variable "datadog_log_subscription_arn" {
  description = "Log subscription arn for shipping logs to datadog"
  default     = ""
}

variable "timeout" {
  description = "The maximum time in seconds that the Lambda can run for"
  default     = 3
}
