variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-0220d79f3f480ecf5"
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
    type   = string
    default = "us-east-1"
    description = "value for region"
}

variable "tags" {
    type = map(string)
    default = {
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
    type = list(string)
    default = [ "0.0.0.0/0" ]
}