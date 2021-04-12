resource "aws_route53_zone" "main_zone" {
  name = var.domain_name

  tags = {
    Created-by = "Cloudify"
  }
}

resource "aws_route53_record" "main_zone_record" {
  zone_id = aws_route53_zone.main_zone.zone_id
  name    = var.domain_name
  type    = "NS"
  ttl     = "300"
  records = [ var.domain_name ]
  # records = aws_route53_zone.dev.name_servers
}
