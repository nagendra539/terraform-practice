variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Redhat-9-DevOps-Practice
}
variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.small"
}
variable "port" {
  description = "The port to allow SSH access"
  type        = number
  default     = 22

}
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "value for region"
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "terraform-instance"
    Project     = "DevOps-Practice"
    Environment = "Dev"
    Terraform   = "true"
    Component   = "backend"
  }
  description = "A map of tags to assign to resources"

}

variable "sg_name" {
  type        = string
  default     = "allow_ssh_terraform"
  description = "Security group name"
}
variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "Environment" {
  type        = string
  default     = "dev"
  description = "Environment value"
}
variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "List of instance names"
}
variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone"
  default     = "123456789"
}
variable "domain_name" {
  type        = string
  description = "The domain name for the record"
  default     = "ns.online"
}
variable "record_type" {
  type        = string
  description = "The type of DNS record"
  default     = "A"
}
variable "ttl" {
  type        = number
  description = "The TTL of the DNS record"
  default     = 300
}