provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-091b599f5f318ddd2"
  instance_type          = "c7i-flex.large"
  key_name               = "junks"
  vpc_security_group_ids = ["sg-0e8005380bc78269f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "my-project-bucket-123456789"
  versioning {
    enabled = true
  }
}
