module "vpc-1" {
  source     = "./modules/vpc"
  vpc_name   = "mycart-vpc"
  vpc_cidr   = "172.16.0.0/16"
  cidr_ip    = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24"]
  az_name    = ["ap-south-1a", "ap-south-1b"]
  public_rt_cidr  = "0.0.0.0/0"
  private_rt_cidr = "0.0.0.0/0"
}

module "security_grp1" {
  source              = "./modules/security-group"
  security_group_name = "sec-grp-1"
  vpc_id              = module.vpc-1.vpc_id

  ingress_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = "0.0.0.0/0" },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = "0.0.0.0/0" },
    { from_port = 27017, to_port = 27017, protocol = "tcp", cidr_blocks = "0.0.0.0/0" } # allow MongoDB port inside VPC
  ]

  egress_rules = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0" }
  ]
}

module "server-1" {
  source               = "./modules/compute"
  ami_id               = "ami-059c4ad5fb36ea79e"
  instance_type_aws    = "t2.micro"
  subnetid             = module.vpc-1.public_subnet-1_id
  security_group_id    = module.security_grp1.security_group_id
  associate_public_ip  = true
}

module "documentdb" {
  source                   = "./modules/documentdb"
  docdb_cluster_identifier = "mycart-docdb-cluster"
  docdb_username           = "mycartuser"
  docdb_password           = "mycartpassword123"  # You can store securely in SSM or Secrets Manager later
  docdb_instance_class     = "db.t3.medium"
  docdb_instance_count     = 1
  db_subnet_group_ids = [
    module.vpc-1.private_subnet-1_id,
    module.vpc-1.private_subnet-2_id]
  security_group_ids       = [module.security_grp1.security_group_id]
  deletion_protection      = false
}
