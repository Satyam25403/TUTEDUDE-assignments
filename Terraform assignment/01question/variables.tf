variable "region" {
  default = "eu-north-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0a716d3f3b16d290c"  
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Optional existing AWS key pair for SSH"
  default     = ""
}

variable "github_repo_url" {
  default = "https://github.com/Satyam25403/github_tutedude"
}
