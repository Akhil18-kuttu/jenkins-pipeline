provider "aws" {
  region = "ap-south-2"
}

# -----------------------------
# Security Group
# -----------------------------

resource "aws_security_group" "akhil_sg" {
  name        = "akhil-security-group"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "akhilSecurityGroup"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------

resource "aws_instance" "akhil_ec2_terraform" {

  ami           = "ami-024ebedf48d280810"
  instance_type = "t3.micro"

  key_name = "akhil-ec2-keypair"

  vpc_security_group_ids = [
    aws_security_group.akhil_sg.id
  ]

  tags = {
    Name = "akhilTerraformEC2"
  }
}

# -----------------------------
# S3 Bucket
# -----------------------------

resource "aws_s3_bucket" "akhil_bucket" {

  bucket = "akhil-s3-bucket-v123
"

  tags = {
    Name = "akhilTerraformBucket"
  }
}
