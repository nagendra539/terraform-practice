resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_terraform"
    description = "Security group to allow SSH access from anywhere"
    
    egress  {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"] 
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # allow SSH from anywhere
        ipv6_cidr_blocks = ["::/0"] # allow SSH from anywhere (IPv6)
    }
    tags = {
        Name = "terraform-managed"
    }
}

resource "aws_instance" "terraform" {
    ami           = "ami-0220d79f3f480ecf5" # devops practice
    for_each = var.instances
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = each.key
    }
    # provisioner "local-exec" {
    #     command = "echo ${self.public_ip} >> instance_ips.txt"
      
    # }
    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321" # Replace with the actual password
        host = self.public_ip
    }
    provisioner "remote-exec" {
        # inline = [
        #     "sudo yum install -y httpd",
        #     "sudo systemctl start httpd",
        #     "sudo systemctl enable httpd"
        # ]
        when    = destroy
        inline = [
            "sudo systemctl stop httpd",
            "sudo yum remove -y httpd"
        ]
    }

}