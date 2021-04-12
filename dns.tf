resource "aws_route53_zone" "main_zone" {
  name = var.domain_name

  tags = {
    Created-by = "Cloudify"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [var.domain_name]
}
