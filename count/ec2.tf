resource "aws_security_group" "allow_ssh_terraform" {
    name = var.sg_name
    description = "Security group to allow SSH access from anywhere"
    
    egress  {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"] 
    }
    ingress {
        from_port   = var.port
        to_port     = var.port
        protocol    = "tcp"
        cidr_blocks = var.cidr_blocks # allow SSH from anywhere
        ipv6_cidr_blocks = ["::/0"] # allow SSH from anywhere (IPv6)
    }
    tags = var.tags
}

resource "aws_instance" "terraform" {
    count = length(var.instance_names)
    ami           = var.ami_id # devops practice
    instance_type = var.Environment == "Prod" ? "t3.medium" : var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = var.instance_names[count.index]
        #Environment = var.Environment
        #tags = var.tags
    }
    #tags = var.tags
}