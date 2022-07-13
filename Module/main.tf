# Create a new replication subnet group

resource "aws_dms_replication_subnet_group" "kiran" {
  replication_subnet_group_description = var.replica_subnet_group_description
  replication_subnet_group_id          = lower(var.replica_subnet_group_id)

  subnet_ids = var.replica_subnet_ids

  tags = merge(var.tags, var.replica_subnet_group_tags)
}

# Database Migration Service requires the below IAM Roles to be created before
#  * dms-vpc-role
#  * dms-cloudwatch-logs-role
#  * dms-access-for-endpoint

data "aws_iam_policy_document" "dms_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["dms.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "dms-access-for-endpoint" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-access-for-endpoint"
}

resource "aws_iam_role_policy_attachment" "dms-access-for-endpoint-AmazonDMSRedshiftS3Role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSRedshiftS3Role"
  role       = aws_iam_role.dms-access-for-endpoint.name
}

resource "aws_iam_role" "dms-cloudwatch-logs-role" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-cloudwatch-logs-role"
}

resource "aws_iam_role_policy_attachment" "dms-cloudwatch-logs-role-AmazonDMSCloudWatchLogsRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSCloudWatchLogsRole"
  role       = aws_iam_role.dms-cloudwatch-logs-role.name
}

resource "aws_iam_role" "dms-vpc-role" {
  assume_role_policy = data.aws_iam_policy_document.dms_assume_role.json
  name               = "dms-vpc-role"
}

resource "aws_iam_role_policy_attachment" "dms-vpc-role-AmazonDMSVPCManagementRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
  role       = aws_iam_role.dms-vpc-role.name
}

# Create a new replication instance

resource "aws_dms_replication_instance" "kiran" {
  allocated_storage            = var.instance_allocated_storage
  apply_immediately            = var.instance_apply_immediately
  allow_major_version_upgrade  = var.instance_allow_major_version_upgarde
  auto_minor_version_upgrade   = var.instance_auto_minor_version_upgrade
  availability_zone            = var.instance_availability_zone
  engine_version               = var.instance_engine_version
  kms_key_arn                  = var.instance_kms_key_arn
  multi_az                     = var.instance_multi_az
  preferred_maintenance_window = var.instance_preferred_maintenance_window
  publicly_accessible          = var.instance_publicly_accessible
  replication_instance_class   = var.instance_replication_instance_class
  replication_instance_id      = var.instance_replication_instance_id
  replication_subnet_group_id  = aws_dms_replication_subnet_group.kiran.id

  tags = merge(var.tags, var.instance_tags)

  vpc_security_group_ids = var.instance_vpc_security_group_ids

  depends_on = [
    aws_iam_role_policy_attachment.dms-access-for-endpoint-AmazonDMSRedshiftS3Role,
    aws_iam_role_policy_attachment.dms-cloudwatch-logs-role-AmazonDMSCloudWatchLogsRole,
    aws_iam_role_policy_attachment.dms-vpc-role-AmazonDMSVPCManagementRole
  ]
}

# Create the endpoint for source & target

resource "aws_dms_endpoint" "kiran" {
  for_each = { for k, v in var.endpoints : k => v if var.create }

  database_name               = lookup(each.value, "database_name", null)
  endpoint_id                 = each.value.endpoint_id
  endpoint_type               = each.value.endpoint_type
  engine_name                 = each.value.engine_name
  extra_connection_attributes = lookup(each.value, "extra_connection_attributes", null)
  kms_key_arn                 = lookup(each.value, "kms_key_arn", null)
  password                    = lookup(each.value, "password", null)
  port                        = lookup(each.value, "port", null)
  server_name                 = lookup(each.value, "server_name", null)
  service_access_role         = lookup(each.value, "service_access_role", null)
  ssl_mode                    = lookup(each.value, "ssl_mode", null)
  username                    = lookup(each.value, "username", null)

}

# Create a replication task

resource "aws_dms_replication_task" "kiran" {
  for_each = { for k, v in var.replication_tasks : k => v if var.create }

  cdc_start_position        = lookup(each.value, "cdc_start_position", null)
  cdc_start_time            = lookup(each.value, "cdc_start_time", null)
  migration_type            = each.value.migration_type
  replication_instance_arn  = aws_dms_replication_instance.kiran.replication_instance_arn
  replication_task_id       = each.value.replication_task_id
  replication_task_settings = lookup(each.value, "replication_task_settings", null)
  table_mappings            = lookup(each.value, "table_mappings", null)
  source_endpoint_arn       = aws_dms_endpoint.kiran[each.value.source_endpoint_key].endpoint_arn
  target_endpoint_arn       = aws_dms_endpoint.kiran[each.value.target_endpoint_key].endpoint_arn
  start_replication_task    = lookup(each.value, "start_replication_task", null)

  tags = merge(var.tags, lookup(each.value, "tags", {}))
}