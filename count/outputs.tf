output "instance_info" {
  value = aws_instance.terraform
}
output "ami_id" {
  value = data.aws_ami.ubuntu.id
}