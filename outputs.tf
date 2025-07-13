output "load_balancer_dns_name" {
  value = aws_lb.test.dns_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.lb_logs.bucket
}

output "vpc_id" {
  value = aws_vpc.main.id
}
