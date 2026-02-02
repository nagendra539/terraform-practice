resource "aws_route53_record" "expense" {
  zone_id = var.zone_id
  #backend.ns.online
  name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = var.record_type
  ttl     = var.ttl
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  count   = length(var.instance_names)
}