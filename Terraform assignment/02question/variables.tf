variable "region" {
  default = "eu-central-1"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format for SSH access"
  type        = string
  default     = "0.0.0.0/0"  # replace with your IP
}
