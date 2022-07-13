variable "create" {
  type        = bool
  description = "Determines whether resources will be created"
  default     = true

}

variable "tags" {
  type        = map(string)
  description = "A map of tags to use on all resources"
  default     = {}

}
variable "replica_subnet_group_description" {
  type        = string
  description = "The description for the subnet group."

}

variable "replica_subnet_group_id" {
  type        = string
  description = "The name for the replication subnet group. This value is stored as a lowercase string."

}

variable "replica_subnet_ids" {
  type        = list(string)
  description = "A list of the EC2 subnet IDs for the subnet group."
  default     = []

}

variable "replica_subnet_group_tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = {}

}

variable "instance_allocated_storage" {
  type        = number
  description = "The amount of storage (in gigabytes) to be initially allocated for the replication instance. Min: 5, Max: 6144, Default: 50"
  default     = null

}

variable "instance_allow_major_version_upgarde" {
  type        = bool
  description = "Indicates that major version upgrades are allowed."
  default     = null

}

variable "instance_apply_immediately" {
  type        = bool
  description = " Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource."
  default     = null

}

variable "instance_auto_minor_version_upgrade" {
  type        = bool
  description = "Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window."
  default     = null

}

variable "instance_availability_zone" {
  type        = string
  description = "The EC2 Availability Zone that the replication instance will be created in."
  default     = null

}

variable "instance_engine_version" {
  type        = string
  description = "The engine version number of the replication instance."
  default     = null

}

variable "instance_kms_key_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region."
  default     = null

}

variable "instance_multi_az" {
  type        = string
  description = "Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true."
  default     = null

}

variable "instance_preferred_maintenance_window" {
  type        = string
  description = "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC)"
  default     = null

}

variable "instance_publicly_accessible" {
  type        = bool
  description = "Specifies the accessibility options for the replication instance"
  default     = null

}

variable "instance_replication_instance_class" {
  type        = string
  description = "The compute and memory capacity of the replication instance as specified by the replication instance class"

}

variable "instance_replication_instance_id" {
  type        = string
  description = "The replication instance identifier. This parameter is stored as a lowercase string."

}

variable "instance_tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}

}

variable "instance_vpc_security_group_ids" {
  type        = list(string)
  description = "A list of VPC security group IDs to be used with the replication instance"
  default     = null

}

variable "endpoints" {
  description = "Map of objects that define the endpoints to be created"
  type        = any
  default     = {}

}

variable "replication_tasks" {
  description = ""
  type        = any
  default     = {}

}