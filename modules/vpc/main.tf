#Creating a AWS-VPC resource
resource "aws_vpc" "vpc_ap-south-1" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
    }
}

#Public Subnet-1 in AZ: ap-south-1a
resource "aws_subnet" "public_subnet-1" {
    vpc_id = aws_vpc.vpc_ap-south-1.id
    cidr_block = var.cidr_ip[0]
    availability_zone = var.az_name[0]

    tags = {
        Name = "Public_subnet-ap-south-1a"
    }
}

# #Private Subnet-1 in AZ: ap-south-1a
# resource "aws_subnet" "private_subnet-1" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id
#     cidr_block = var.cidr_ip[1]
#     availability_zone = var.az_name[0]

#     tags = {
#         Name = "Private_subnet-ap-south-1a"
#     }
# }

# #Public Subnet-2 in AZ: ap-south-1b
# resource "aws_subnet" "public_subnet-2" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id
#     cidr_block = var.cidr_ip[1]
#     availability_zone = var.az_name[1]

#     tags = {
#         Name = "Public_subnet-ap-south-1b"
#     }
# }

#Private Subnet-2 in AZ: ap-south-1b
# resource "aws_subnet" "private_subnet-2" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id
#     cidr_block = var.cidr_ip[2]
#     availability_zone = var.az_name[1]

#     tags = {
#         Name = "Private_subnet-ap-south-1b"
#     }
# }

#Internet Gateway:
# resource "aws_internet_gateway" "igw" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id

#     tags = {
#         Name = "main"
#     }
# }

# #Elastic IP:
# resource "aws_eip" "elastic_ip" {}

# #NAT Gateway:
# resource "aws_nat_gateway" "nat_gateway" {
#     allocation_id = aws_eip.elastic_ip.id
#     subnet_id = aws_subnet.public_subnet-1.id

#     tags = {
#         Name = "main_nat"
#     }
# }

# #Route Table: Public
# resource "aws_route_table" "public_RT" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id

#     route {
#         gateway_id = aws_internet_gateway.igw.id
#         cidr_block = var.public_rt_cidr
#     }

#     tags = {
#         Name = "Public-RT"
#     }
# }

# #Route Table: Private
# resource "aws_route_table" "private_RT" {
#     vpc_id = aws_vpc.vpc_ap-south-1.id

#     route {
#         cidr_block = var.private_rt_cidr
#         nat_gateway_id = aws_nat_gateway.nat_gateway.id
#     }

#     tags = {
#         Name = "Private-RT"
#     }
# }

# resource "aws_route_table_association" "public_association_1" {
#     subnet_id = aws_subnet.public_subnet-1.id
#     route_table_id = aws_route_table.public_RT.id
# }

# resource "aws_route_table_association" "public_association_2" {
#     subnet_id = aws_subnet.public_subnet-2.id
#     route_table_id = aws_route_table.public_RT.id
# }

# resource "aws_route_table_association" "private_association_1" {
#     subnet_id = aws_subnet.private_subnet-1.id
#     route_table_id = aws_route_table.private_RT.id
# }

# resource "aws_route_table_association" "private_association_2" {
#     subnet_id = aws_subnet.private_subnet-2.id
#     route_table_id = aws_route_table.private_RT.id
# }