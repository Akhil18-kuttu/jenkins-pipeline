output "instance_public_ip" {
  value = aws_instance.akhil_ec2_terraform.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.akhil_bucket.bucket
}

