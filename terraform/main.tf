# WARNING: Intentionally misconfigured for training
# DO NOT use this configuration in production

resource "aws_s3_bucket" "data" {
  bucket = "company-data-bucket"
}

# ISSUE: Public access not blocked
resource "aws_s3_bucket_public_access_block" "data" {
  bucket = aws_s3_bucket.data.id
  
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ISSUE: SSH open to world
resource "aws_security_group" "web" {
  name = "web-sg"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ISSUE: Unencrypted database with hardcoded password
resource "aws_db_instance" "main" {
  identifier        = "production-db"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  
  username          = "admin"
  password          = "hardcoded-password"
  
  storage_encrypted   = false
  publicly_accessible = true
}

