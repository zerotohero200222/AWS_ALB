terraform {
  backend "s3" {
    bucket = "terraform-state-alb-dev"
    key    = "alb/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
