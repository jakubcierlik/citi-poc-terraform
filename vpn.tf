# TODO: sort out networking - vpc and subnet with DB VM and openshift clusters
# resource "aws_vpn_gateway" "vpn_gateway" {
#   vpc_id = aws_vpc.main_vpc.id
# }

# resource "aws_customer_gateway" "customer_gateway" {
#   bgp_asn    = 65000
#   ip_address = "160.0.0.1"
#   type       = "ipsec.1"
# }

# resource "aws_vpn_connection" "main" {
#   vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
#   customer_gateway_id = aws_customer_gateway.customer_gateway.id
#   type                = "ipsec.1"
#   static_routes_only  = true
# }

# examplary specific route if needed
# resource "aws_vpn_connection_route" "office" {
#   destination_cidr_block = "192.168.10.0/24"
#   vpn_connection_id      = aws_vpn_connection.main.id
# }

