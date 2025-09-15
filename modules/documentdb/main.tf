# resource "aws_docdb_subnet_group" "docdb_subnet_group" {
#   name       = "docdb-subnet-group-prod"
#   subnet_ids = var.db_subnet_group_ids

#   tags = {
#     Name = "docdb-subnet-group-prod"
#   }
# }

# resource "aws_docdb_cluster" "docdb_cluster" {
#   cluster_identifier      = var.docdb_cluster_identifier
#   engine                  = "docdb"
#   master_username         = var.docdb_username
#   master_password         = var.docdb_password
#   db_subnet_group_name    = aws_docdb_subnet_group.docdb_subnet_group.name
#   vpc_security_group_ids  = var.security_group_ids
#   backup_retention_period = 7
#   preferred_backup_window = "07:00-09:00"
#   skip_final_snapshot     = true
#   deletion_protection     = var.deletion_protection

#   tags = {
#     Name = "docdb-cluster-prod"
#   }
# }

# resource "aws_docdb_cluster_instance" "docdb_instance" {
#   count              = var.docdb_instance_count
#   identifier         = "${var.docdb_cluster_identifier}-${count.index}"
#   cluster_identifier = aws_docdb_cluster.docdb_cluster.id
#   instance_class     = var.docdb_instance_class

#   tags = {
#     Name = "docdb-instance-prod-${count.index}"
#   }
# }
