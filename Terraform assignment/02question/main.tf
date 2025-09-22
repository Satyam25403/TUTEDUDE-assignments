provider "aws" {
  region = var.region
}

# ---------------------
# Security Group for Backend
# ---------------------
resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Allow Flask port 5000 and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Flask from frontend"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # frontend EC2 can reach backend
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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

# ---------------------
# Security Group for Frontend
# ---------------------
resource "aws_security_group" "frontend_sg" {
  name        = "frontend-sg"
  description = "Allow Express port 3000 and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Express from internet"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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

# ---------------------
# Backend EC2
# ---------------------
resource "aws_instance" "backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  user_data = file("${path.module}/user_data/backend.sh")

  tags = {
    Name = "Flask-Backend"
  }
}

# ---------------------
# Frontend EC2
# ---------------------
resource "aws_instance" "frontend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  user_data = templatefile("${path.module}/user_data/frontend.sh", {
    backend_ip = aws_instance.backend.public_ip
  })

  tags = {
    Name = "Express-Frontend"
  }
}

