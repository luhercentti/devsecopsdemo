# infrastructure/main.tf

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "data" {
  bucket = "my-devsecops-demo-bucket"
  # Missing encryption (intentional security issue)
  # Missing versioning (intentional security issue)
}

resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow web traffic"

  # Overly permissive ingress rule (intentional security issue)
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# IAM user with admin access (intentional security issue)
resource "aws_iam_user" "admin" {
  name = "admin-user"
}

resource "aws_iam_user_policy_attachment" "admin_policy" {
  user       = aws_iam_user.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}