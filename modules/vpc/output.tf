output "vpc_id" {
  value = aws_vpc.vpc_ap-south-1.id
}

output "public_subnet-1_id" {
    value = aws_subnet.public_subnet-1.id
}

# output "public_subnet-2_id" {
#     value = aws_subnet.public_subnet-2.id
# }

output "private_subnet-1_id" {
    value = aws_subnet.private_subnet-1.id
}

# output "private_subnet-2_id" {
#     value = aws_subnet.private_subnet-2.id
# }

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "eip_id" {
  value = aws_eip.elastic_ip.id
}

output "ngw_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "public_rt_id" {
  value = aws_route_table.public_RT.id
}

output "private_rt_id" {
  value = aws_route_table.private_RT.id
}