variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Optional existing AWS key pair for SSH"
  default     = ""
}

variable "github_repo_url" {
  default = "https://github.com/Satyam25403/github_tutedude.git"
}
