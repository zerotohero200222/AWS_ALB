variable "aws_region" {
  type    = string
  default = "us-east-1"
}

resource "random_pet" "lb_name" {
  length = 2
}

resource "random_string" "log_prefix" {
  length  = 8
  special = false
  upper   = false
}

resource "random_string" "env_tag" {
  length  = 5
  special = false
  upper   = false
}

output "generated_lb_name" {
  value = "${random_pet.lb_name.id}-alb"
}

output "log_prefix" {
  value = random_string.log_prefix.result
}

output "environment_tag" {
  value = random_string.env_tag.result
}
